//
//  HomeView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/8/23.
//

import SwiftUI


struct HomeView: View {
    @Binding var showSignInView: Bool
    @Binding var showPurchaseHistoryView: Bool
    @State var pageIndex = 0
    @State var showingPaymentView = false
    
    var myLightGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
    var listGray: Color = Color(red: 242/255, green: 242/255, blue: 247/255)
    var body: some View {
        VStack (spacing: 0){
            HeaderView(showSignInView: $showSignInView, pageIndex: $pageIndex, showPurchaseHistoryView: $showPurchaseHistoryView)
            TabView (selection: $pageIndex){
                MainPageScrollableView(showSignInView: $showSignInView).tag(0)
                PurchaseHistoryView().tag(1)
                CardsView().tag(2)
                PaymentView(showingPaymentView: $showingPaymentView).tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: UIScreen.main.bounds.height-90-135)
            .frame(maxWidth: .infinity)
            FooterView(showSignInView: $showSignInView, pageIndex: $pageIndex, showPurchaseHistoryView: $showPurchaseHistoryView)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showSignInView: .constant(false), showPurchaseHistoryView: .constant(false))
    }
}
