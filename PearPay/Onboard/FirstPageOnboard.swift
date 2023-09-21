//
//  FirstPageOnboard.swift
//  PearPay
//
//  Created by Zachary Wolfe on 9/2/23.
//

import SwiftUI

struct FirstPageOnboard: View {
    var body: some View {
        VStack{
            Image("OnboardWelcome")
                .resizable()
                .frame(height: 375)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
                .padding(.top, 20)
            HStack (spacing: 0){
                Text("Welcome to ")
                    .font(.custom("Helvetica Neue", size: 30))
                    .fontWeight(.semibold)
                Image("pearPayIconPink")
                    .resizable()
                    .frame(width: 30, height: 30)                
                Text("Pear Pay!")
                    .font(.custom("Helvetica Neue", size: 30))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 233/255, green: 30/255, blue: 99/255))
            }
            Text("Experience a new and refreshing approach")
                .font(.custom("Helvetica Neue", size: 18))
                .fontWeight(.light)
                .lineLimit(1)
            Text("to managing your finances.")
                .font(.custom("Helvetica Neue", size: 18))
                .fontWeight(.light)
                .lineLimit(1)
            HStack (spacing: 0){
                Text("Mobile Banking ")
                    .font(.custom("Helvetica Neue", size: 24))
                    .fontWeight(.light)
                Text("Reimagined 🚀")
                    .foregroundColor(.blue)
                    .font(.custom("Helvetica Neue", size: 24))
                    .fontWeight(.bold)
            }
            .padding(.top, 20)
            Spacer()
        }
        .padding(.bottom, 40)
    }
}
