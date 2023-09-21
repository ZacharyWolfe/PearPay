//
//  UpdatePasswordView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/26/23.
//

import SwiftUI

struct UpdatePasswordView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    @Binding var hasPressedUpdatePass: Bool
    @Binding var newPassword: String
    @State var newPassword2: String = ""
    
    var body: some View {
        VStack{
            HStack{
                HStack{
                    SecureField("New password...", text: $newPassword)
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
                    SecureField("New Email...", text: $newPassword2)
                }
                .padding(.leading, 15)
            }
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.4))
            .cornerRadius(10)
            .padding(.top, 15)
            Button{
                Task{
                    do{
                        try await viewModel.updatePassword(password: newPassword)
                        hasPressedUpdatePass = false
                        print("UPDATE PASSWORD")
                    }
                    catch{
                        hasPressedUpdatePass = true
                        print(error)
                        print("Update Password Error")
                    }
                }
            } label: {
                HStack{
                    HStack{
                        Text("Update")
                            .foregroundColor(.black)
                    }
                }
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(10)
                .padding(.top, 15)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct UpdatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePasswordView(hasPressedUpdatePass: .constant(false), newPassword: .constant(""))
    }
}
