//
//  PearPayAddCardView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 9/2/23.
//

import SwiftUI

struct PearPayAddCardView: View {
    @Binding var addCardView: Bool
    var body: some View {
        VStack{
            Image("CardConcept")
                .resizable()
                .frame(width: 275, height: 300)
            HStack (alignment: .lastTextBaseline, spacing: 5){
                Image("pearPayIconBlack")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Pay")
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .padding(.top, 15)
            }
            VStack (spacing: 0){
                Text("By submitting card-related information you hereby engage in an agreement with Pear Pay. Pear Pay has full authority to allow for secure payments, and sending money to peers. Continuing grants access to cards, you, the user may add, and the transferring of capital as well as, but not limited to, gathering information related to card use.")
                Text("Pressing continue means you agree to Pear Pay's")
                    .padding(.top, 20)
                Link("terms of service",
                      destination: URL(string: "https://www.google.com")!)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal, 15)
            .font(.system(size: 15))
            .fontWeight(.bold)
            .foregroundColor(Color(UIColor.lightGray))
            HStack{
                HStack{
                    Text("Continue")
                        .foregroundColor(.white)
                }
            }
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.blue)
            .cornerRadius(15)
            .padding(.top, 30)
            .padding(.horizontal, 20)
        }
    }
}
