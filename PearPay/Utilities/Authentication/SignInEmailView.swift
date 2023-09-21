//
//  SignInEmailView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/7/23.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
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

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    @Binding var showingSignInEmailView: Bool
    var body: some View {
        VStack{
            Button{
                Task{
                    do{
                        try viewModel.signOut()
                        showingSignInEmailView = false
                        showSignInView = true
                    }
                    catch{
                        print(error)
                        print("SignInEmailView Error")
                    }
                }
            } label: {
                HStack{
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
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
                Text("Thank you for being a member")
                .font(.system(size: 20))
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .padding(.top, 15)
                HStack{
                    HStack{
                        TextField("Email...", text: $viewModel.email)
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
                Spacer()
                Button{
                    Task{
                        do{
                            try await viewModel.signIn()
                            showingSignInEmailView = false
                            showSignInView = false
                            return
                        }
                        catch{
                            showSignInView = true
                            print(error)
                            print("SignInEmailView Error2")
                        }
                    }
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 70)
            }
            .padding(.horizontal, 30)
            .padding(.top, 40)
            Spacer()
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.endEditing(true)
        }
        .background(LinearGradient(colors: [Color(red: 83/255, green: 252/255, blue: 128/255), .green], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignInEmailView(showSignInView: .constant(false), showingSignInEmailView: .constant(false))
    }
}
