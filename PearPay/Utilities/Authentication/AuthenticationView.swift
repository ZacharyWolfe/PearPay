//
//  AuthenticationView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/7/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct GoogleSignInResultModel{
    let idToken: String
    let accessToken: String
}

@MainActor
final class AuthenticationViewModel: ObservableObject {
    func signInGoogle() async throws{

        guard let topVC = Utilities.shared.topViewController() else{
            throw URLError(.cannotFindHost)
        }

        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)

        guard let idToken: String = gidSignInResult.user.idToken?.tokenString else{
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
    }
}

struct AuthenticationView: View {
    @Binding var showingSignInEmailView: Bool
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    @Binding var showingSignUpEmailView: Bool
    var body: some View {
        VStack (spacing: 0){
            VStack{
                Text("Mobile Payments")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.custom("SF Pro", size: 36))
                    .padding(.top, 30)
                Text("Reimagined 🚀")
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .font(.custom("SF Pro", size: 36))
                Image("pearPayIcon")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.top, 25)
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            VStack{
                Button{
                    showingSignInEmailView = true
                } label: {
                    HStack{
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                            .font(.system(size: 24))
                            .padding(.trailing, 10)
                        Text("Sign in with Email")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.green)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                    )
                }
                .fullScreenCover(isPresented: $showingSignInEmailView){
                    NavigationStack{
                        SignInEmailView(showSignInView: $showSignInView, showingSignInEmailView: $showingSignInEmailView)
                    }
                }
                .padding(.top, 50)
                Button{
                    Task{
                        do{
                            try await viewModel.signInGoogle()
                            showSignInView = false
                        }
                        catch{
                            showSignInView = true
                            print(error)
                            print("Sign In with google error")
                        }
                    }
                } label: {
                    HStack{
                        Image("googIcon")
                            .resizable()
                            .frame(width: 65, height: 32)
                        Text("Sign in with Google")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0/255, green: 0/255, blue: 254/255))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                    )
                }
                .padding(.vertical, 15)
                Button {
                    showingSignUpEmailView = true
                } label: {
                    HStack{
                        Image(systemName: "person")
                            .foregroundColor(.black)
                            .padding(.leading, 15)
                            .font(.system(size: 24))
                        Text("Create an account")
                            .padding(.leading, 20)
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 230/255, green: 0/255, blue: 0/255))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                    )
                }
                .fullScreenCover(isPresented: $showingSignUpEmailView){
                    NavigationStack{
                        SignUpEmailView(showSignInView: $showSignInView, showingSignInEmailView: $showingSignInEmailView, showingSignUpEmailView: $showingSignUpEmailView)
                    }
                }
                Button {
                    showSignInView = false
                } label: {
                    HStack{
                        Image(systemName: "person.badge.key.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 24))
                            .padding(.trailing, 10)
                        Text("Sign in as Guest")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.purple)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                    )
                }
                .padding(.vertical, 15)
            }
            .padding(.horizontal)
            Spacer()
            HStack{
                Image(systemName: "c.circle")
                Text(" 2023 PearPay. All rights reserved.")
            }
            .font(.system(size: 15))
            .fontWeight(.bold)
            .foregroundColor(Color(red: 233/255, green: 30/255, blue: 99/255))
        }
        .padding()
        .background(.white)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AuthenticationView(showingSignInEmailView: .constant(false), showSignInView: .constant(false), showingSignUpEmailView: .constant(false))
        }
    }
}
