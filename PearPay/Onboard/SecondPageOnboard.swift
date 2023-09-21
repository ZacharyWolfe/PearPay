//
//  SecondPageOnboard.swift
//  PearPay
//
//  Created by Zachary Wolfe on 9/2/23.
//

import SwiftUI

struct SecondPageOnboard: View {
    var body: some View {
        VStack{
            Image("OnboardSave")
                .resizable()
                .frame(height: 325)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
                .padding(.top, 20)
            VStack{
                Text("Pear Pay offers a one-stop shop")
                    .font(.custom("Helvetica Neue", size: 24))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("for all your accounts.")
                    .font(.custom("Helvetica Neue", size: 24))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Swipe through your most important pages")
                    .font(.custom("Helvetica Neue", size: 18))
                    .fontWeight(.light)
                    .padding(.horizontal)
                    .lineLimit(1)
                    .padding(.top, 10)
                Text("swiftly with our toolbar design.")
                    .font(.custom("Helvetica Neue", size: 18))
                    .fontWeight(.light)
                    .padding(.horizontal)
            }
            HStack{
                VStack{
                    Image(systemName: "rectangle.3.group.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 32, height: 25)
                    Text("Home")
                        .font(.caption)
                }
                VStack{
                    Image(systemName: "clock.arrow.circlepath")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 28, height: 25)
                    Text("History")
                        .font(.caption)
                }
                VStack{
                    Image(systemName: "creditcard.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 32, height: 25)
                    Text("Wallet")
                        .font(.caption)
                }
                VStack{
                    Image(systemName: "tag.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 28, height: 25)
                    Text("Shop")
                        .font(.caption)
                }
            }
            .padding(.top, 15)
        }
        .padding(.bottom, 40)
    }
}
