//
//  SettingsView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/8/23.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject{
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws{
        let authUser = try AuthenticationManager.shared.getAuthenticationUser()
        
        guard let email = authUser.email else{
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail(email: String) async throws{
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword(password: String) async throws{
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
    
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    @State private var showAlert = false
    
    @State var hasPressedUpdatePass: Bool = false
    @State var hasPressedResetPass: Bool = false
    @State var hasPressedUpdateEmail: Bool = false
    
    @State var newEmail     = ""
    @State var newPassword    = ""
    
    @Binding var showSignInView: Bool
    
    var listGray = Color(red: 242/255, green: 247/252, blue: 242/255)
    
    var body: some View {
        VStack{
            Text("Settings")
                .font(.title)
                .fontWeight(.bold)
            List{
                //The email portion of the settings
                emailSection
                Button("Log out"){
                    showAlert = true
                }
                //An alert to ask the user if they actually want to log out
                .alert("Pearpay", isPresented: $showAlert){
                    Button("Confirm"){
                        Task{
                            do{
                                try viewModel.signOut()
                                hasPressedResetPass = false
                                hasPressedUpdatePass = false
                                hasPressedUpdateEmail = false
                                showSignInView = true
                            }
                            catch{
                                print("Can't logout")
                            }
                        }
                    }
                    Button("Cancel", role: .cancel){
                    }
                } message: {
                    Text("Are you sure you would like to log out?")
                }
                .foregroundColor(.red)
            }
            Spacer()
            if hasPressedResetPass{
                Text("An email will arrive shortly to with further instructions.")
                    .font(.custom("Helvetica Neue", size: 24))
                        .fontWeight(.medium)
            }
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingsView(showSignInView: .constant(false))
        }
    }
}

extension SettingsView{
    private var emailSection: some View{
        Section{
            Button("Update password"){
                hasPressedUpdatePass = true
            }
            .sheet(isPresented: $hasPressedUpdatePass, onDismiss: {hasPressedUpdatePass = false}){
                UpdatePasswordView(hasPressedUpdatePass: $hasPressedUpdatePass,newPassword: $newPassword)
                    .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
            }
            Button("Reset password"){
                Task{
                    do{
                        try await viewModel.resetPassword()
                        print("PASSWORD RESET")
                    }
                    catch{
                        print(error)
                        print("PasswordReset Error")
                    }
                }
                hasPressedResetPass = true
            }
            Button("Update email"){
                hasPressedUpdateEmail = true
            }
            .sheet(isPresented: $hasPressedUpdateEmail, onDismiss: {hasPressedUpdateEmail = false}){
                UpdateEmailView(hasPressedUpdateEmail: $hasPressedUpdateEmail, newEmail: $newEmail)
                 .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
            }
        } header: {
            Text("Email & Password")
        }
    }
}
