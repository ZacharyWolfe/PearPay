//
//  ThirdPageOnboard.swift
//  PearPay
//
//  Created by Zachary Wolfe on 9/2/23.
//

import SwiftUI

struct ThirdPageOnboard: View {
    let myDarkGray:  Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    
    var body: some View {
        VStack{
            Image("OnboardShop")
                .resizable()
                .frame(width: 375, height: 325)
                .padding(.bottom, 20)
                .padding(.top, 20)
            Text("Purchase your favorite things ")
                .font(.custom("Helvetica Neue", size: 26))
                .fontWeight(.medium)
            Text("simpler.")
                .font(.custom("Helvetica Neue", size: 26))
                .fontWeight(.bold)
                .foregroundColor(.blue)
            Text("In just a phone tap.")
                .font(.custom("Helvetica Neue", size: 18))
                .fontWeight(.light)
                .padding(.top, 10)
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
                        .foregroundColor(myDarkGray)
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
            .padding(.top, 20)
        }
        .padding(.bottom, 40)
    }
}
