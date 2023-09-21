//
//  FooterView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/8/23.
//

import SwiftUI

struct FooterView: View {
    @Binding var showSignInView: Bool
    @Binding var pageIndex: Int
    @Binding var showPurchaseHistoryView: Bool
    
    @State var showingPaymentView: Bool = false
    
    let myDarkGray:  Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    let myLightGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
    let listGray:    Color = Color(red: 242/255, green: 242/255, blue: 247/255)

    var body: some View {
        HStack{
            Spacer()
            if(pageIndex != 0){
                NavigationLink(destination: HomeView(showSignInView: $showSignInView, showPurchaseHistoryView: $showPurchaseHistoryView, pageIndex: 0).navigationBarBackButtonHidden(true)){
                    VStack{
                        Image(systemName: "rectangle.3.group.fill")
                            .resizable()
                            .foregroundColor(myDarkGray)
                            .frame(width: 32, height: 25)
                        Text("Dashboard")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(myDarkGray)
                    }
                    .frame(width: 65, height: 40)
                }
            }
            else{
                VStack{
                    Image(systemName: "rectangle.3.group.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 36, height: 29)
                    Text("Dashboard")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                .frame(width: 65, height: 40)
            }
            Spacer()
            if(pageIndex != 1){
                NavigationLink(destination: HomeView(showSignInView: $showSignInView, showPurchaseHistoryView: $showPurchaseHistoryView, pageIndex: 1).navigationBarBackButtonHidden(true)){
                    VStack{
                        Image(systemName: "clock.arrow.circlepath")
                            .resizable()
                            .foregroundColor(myDarkGray)
                            .frame(width: 28, height: 25)
                        Text("History")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(myDarkGray)
                    }
                    .frame(width: 65, height: 40)
                }
            }
            else{
                VStack{
                    Image(systemName: "clock.arrow.circlepath")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 36, height: 33)
                    Text("History")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                .frame(width: 65, height: 40)
            }
            Spacer()
            if(pageIndex != 2){
                NavigationLink(destination: HomeView(showSignInView: $showSignInView, showPurchaseHistoryView: $showPurchaseHistoryView, pageIndex: 2).navigationBarBackButtonHidden(true)){
                    VStack{
                        Image(systemName: "creditcard.fill")
                            .resizable()
                            .foregroundColor(myDarkGray)
                            .frame(width: 32, height: 25)
                        Text("Wallet")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(myDarkGray)
                    }
                    .frame(width: 65, height: 40)
                }
            }
            else{
                VStack{
                    Image(systemName: "creditcard.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 36, height: 29)
                    Text("Wallet")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                .frame(width: 65, height: 40)
            }
            Spacer()
            FooterViewExtensionView(showingPaymentView: $showingPaymentView, showSignInView: $showSignInView, pageIndex: $pageIndex, showPurchaseHistoryView: $showPurchaseHistoryView)
        }
        .padding(.bottom, 20)
        .frame(height: 90)
        .frame(maxWidth: .infinity)
        .background(.white)
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(showSignInView: .constant(false), pageIndex: .constant(0), showPurchaseHistoryView: .constant(false))
    }
}
