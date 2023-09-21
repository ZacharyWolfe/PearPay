//
//  SignUpEmailView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/8/23.
//

import SwiftUI

@MainActor
final class SignUpEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var passwordChecker = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or password found.")
            throw URLError(.badURL)
        }
        
        let _ = try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or password found.")
            throw URLError(.badURL)
        }
        
        let _ = try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}

struct SignUpEmailView: View {
    @StateObject private var viewModel = SignUpEmailViewModel()
    @Binding var showSignInView: Bool
    @Binding var showingSignInEmailView: Bool
    @Binding var showingSignUpEmailView: Bool
    var passwordsEquiv: Bool = false
    var hasAccount: Bool = false
    var body: some View {
        VStack{
            Button{
                Task{
                    do{
                        try viewModel.signOut()
                        showingSignUpEmailView = false
                        showSignInView = true
                    }
                    catch{
                        print(error)
                        print("SignUpEmailView Error")
                    }
                }
            } label: {
                HStack{
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.black)
                        .padding(.trailing, 20)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                }
                .padding(.top, 10)
            }
            VStack{
                Image("pearPayIcon")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.top, 25)
                    .shadow(color: .black, radius: 7)
                Text("Thank you for becoming a member")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .padding(.top, 15)
                HStack{
                    HStack{
                        TextField("Register your email...", text: $viewModel.email)
                    }
                    .padding(.leading, 15)
                }
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(.top, 15)
                HStack{
                    HStack{
                        SecureField("Password...", text: $viewModel.password)
                    }
                    .padding(.leading, 15)
                }
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(.top, 15)
                HStack{
                    HStack{
                        SecureField("Retype your password...", text: $viewModel.passwordChecker)
                    }
                    .padding(.leading, 15)
                }
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.4))
                .cornerRadius(10)
                .padding(.top, 15)
                Spacer()
                let passwordsEquiv = (viewModel.password == viewModel.passwordChecker)
                Button{
                    Task{
                        do{
                            if (passwordsEquiv){
                                try await viewModel.signUp()
                                showSignInView = false
                                return
                            }
                        }
                        catch{
                            showSignInView = true
                            print(error)
                            print("SignUpEmailView Error2")
                        }
                        do{
                            if (passwordsEquiv){
                                try await viewModel.signIn()
                                showSignInView = false
                                return
                            }
                        }
                        catch{
                            showSignInView = true
                            print(error)
                            print("SignUpEmailView Error3")
                        }
                    }
                } label: {
                    VStack{
                        Spacer()
                        Text("Register Account!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 70)
                if (!passwordsEquiv){
                    Text("Passwords do not match.")
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 40)
            Spacer()
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.endEditing(true)
        }
        .background(.white)
    }
}

struct SignUpEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpEmailView(showSignInView: .constant(false), showingSignInEmailView: .constant(false), showingSignUpEmailView: .constant(false))
    }
}
