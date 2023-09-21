//
//  FinalPageOnboard.swift
//  PearPay
//
//  Created by Zachary Wolfe on 9/3/23.
//

import SwiftUI

struct FinalPageOnboard: View {
    var body: some View {
        VStack{
            Image("OnboardFriends")
                .resizable()
                .frame(height: 375)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
                .padding(.top, 20)
            Text("Connect with friends ")
                .font(.custom("Helvetica Neue", size: 26))
                .fontWeight(.medium)
            Text("Seamlessly connect with friends and family,")
                .font(.custom("Helvetica Neue", size: 14))
                .fontWeight(.light)
            Text("making payments and splitting bills a breeze.")
                .font(.custom("Helvetica Neue", size: 14))
                .fontWeight(.light)
        }
        .padding(.bottom, 40)
    }
}
