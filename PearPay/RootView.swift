//
//  RootView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/7/23.
//

import SwiftUI

struct RootView: View {
    
    @Binding var showSignInView: Bool
    @Binding var showingSignInEmailView: Bool
    @Binding var showingSignUpEmailView: Bool
    @Binding var showPurchaseHistoryView: Bool
    
    var body: some View {
        ZStack{
            if showSignInView{
                NavigationStack{
                    AuthenticationView(showingSignInEmailView: $showingSignInEmailView,showSignInView: $showSignInView, showingSignUpEmailView: $showingSignUpEmailView)
                }
            }
            else{
                NavigationStack{
                    HomeView(showSignInView: $showSignInView, showPurchaseHistoryView: $showPurchaseHistoryView, pageIndex: 0)
                }
            }
        }
        .onAppear {
            do{
                try signOut()
            }
            catch{
                print(error)
            }
            let authUser = try? AuthenticationManager.shared.getAuthenticationUser()
            self.showSignInView = authUser == nil
        }
    }
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(showSignInView: .constant(false), showingSignInEmailView: .constant(false), showingSignUpEmailView: .constant(false), showPurchaseHistoryView: .constant(false))
    }
}
