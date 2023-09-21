//
//  AuthenticationManager.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/7/23.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{
    let uid: String
    let email: String?
    let photoUrl: String?
}

final class AuthenticationManager: ObservableObject {
    
    static let shared = AuthenticationManager()
    public init(){}
    
    func getAuthenticationUser() throws ->AuthDataResultModel {
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(uid: user.uid, email: user.email, photoUrl: user.photoURL?.absoluteString)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}

// MARK: SIGN IN EMAIL
extension AuthenticationManager{
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(
            uid: authDataResult.user.uid,
            email: authDataResult.user.email,
            photoUrl: authDataResult.user.photoURL?.absoluteString)
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(uid: authDataResult.user.uid, email: authDataResult.user.email, photoUrl: authDataResult.user.photoURL?.absoluteString)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String) async throws{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        
        try await user.updatePassword(to: password)
    }
    
    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        
        try await user.updateEmail(to: email)
    }
}

// MARK: SIGN IN SSO
extension AuthenticationManager{
    
    @discardableResult
    func signInWithGoogle (tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel{
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
    func signIn (credential: AuthCredential) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(uid: authDataResult.user.uid, email: authDataResult.user.email, photoUrl: authDataResult.user.photoURL?.absoluteString)
    }
}
