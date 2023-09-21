//
//  UpdateEmailView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/26/23.
//

import SwiftUI

struct UpdateEmailView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    @Binding var hasPressedUpdateEmail: Bool
    @Binding var newEmail: String
    @State var newEmail2: String = ""

    var body: some View {
        VStack{
            HStack{
                HStack{
                    TextField("New Email...", text: $newEmail)
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
                    TextField("Re-enter Email...", text: $newEmail2)
                }
                .padding(.leading, 15)
            }
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.4))
            .cornerRadius(10)
            .padding(.vertical, 15)
            Button{
                Task{
                    do{
                        try await viewModel.updatePassword(password: newEmail)
                        hasPressedUpdateEmail = false
                        print("UPDATE PASSWORD")
                    }
                    catch{
                        print(error)
                        hasPressedUpdateEmail = true
                        print("Update Password Error")
                    }
                }
            } label: {
                HStack{
                    Text("Update")
                        .foregroundStyle(.black)
                }
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(10)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct UpdateEmailView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateEmailView(hasPressedUpdateEmail: .constant(false), newEmail: .constant(""))
    }
}
