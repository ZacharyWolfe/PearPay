//
//  FooterViewExtensionView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/18/23.
//

import SwiftUI

struct FooterViewExtensionView: View {
    let myDarkGray: Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    
    @Binding var showingPaymentView: Bool
    @Binding var showSignInView: Bool
    @Binding var pageIndex: Int
    @Binding var showPurchaseHistoryView: Bool
    
    var body: some View {
        VStack{
            VStack{
                if pageIndex != 3{
                    NavigationLink(destination: HomeView(showSignInView: $showSignInView, showPurchaseHistoryView: $showPurchaseHistoryView, pageIndex: 3).navigationBarBackButtonHidden(true)){
                        VStack{
                            Image(systemName: "tag.fill")
                                .resizable()
                                .foregroundColor(myDarkGray)
                                .frame(width: 28, height: 25)
                            Text("Shop")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(myDarkGray)
                        }
                    }
                }
                else{
                    VStack{
                        Image(systemName: "tag.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 32, height: 29)
                        Text("Shop")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }
            }
            .frame(width: 65, height: 40)
        }
        .sheet(isPresented: $showingPaymentView, onDismiss: {showingPaymentView = false}){
            PaymentView(showingPaymentView: $showingPaymentView)
        }
        Spacer()
    }
}

struct FooterViewExtensionView_Previews: PreviewProvider {
    static var previews: some View {
        FooterViewExtensionView(showingPaymentView: .constant(false), showSignInView: .constant(false), pageIndex: .constant(0), showPurchaseHistoryView: .constant(false))
    }
}
