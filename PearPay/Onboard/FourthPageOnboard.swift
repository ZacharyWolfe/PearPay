//
//  FourthPageOnboard.swift
//  PearPay
//
//  Created by Zachary Wolfe on 9/3/23.
//

import SwiftUI

struct FourthPageOnboard: View {
    let myDarkGray:  Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    
    var body: some View {
        VStack{
            Image("OnboardCreditCard")
                .resizable()
                .frame(height: 350)
                .frame(maxWidth: 300)
                .padding(.top, 20)
            Text("Securely manage your accounts.")
                .font(.custom("Helvetica Neue", size: 24))
                .fontWeight(.semibold)
            HStack(spacing:0){
                Text("Rest easy knowing your transactions are ")
                    .font(.custom("Helvetica Neue", size: 16))
                    .fontWeight(.light)
                Text("secure")
                    .font(.custom("Helvetica Neue", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            Text("and your banking needs are")
                .font(.custom("Helvetica Neue", size: 16))
                .fontWeight(.light)
                .padding(.horizontal)
            Text("within reach.")
                .font(.custom("Helvetica Neue", size: 16))
                .fontWeight(.light)
                .padding(.horizontal)
            HStack{
                VStack{
                    Image(systemName: "rectangle.3.group.fill")
                        .resizable()
                        .foregroundColor(myDarkGray)
                        .frame(width: 32, height: 25)
                    Text("Home")
                        .font(.caption)
                }
                VStack{
                    Image(systemName: "clock.arrow.circlepath")
                        .resizable()
                        .foregroundColor(myDarkGray)
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
                        .foregroundColor(myDarkGray)
                        .frame(width: 28, height: 25)
                    Text("Shop")
                        .font(.caption)
                }
            }
            .padding(.top, 20)
        }
        .padding(.bottom, 40)
    }
}
