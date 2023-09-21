//
//  MainPageScrollableView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/8/23.
//

import SwiftUI

struct MainPageScrollableView: View {
    @Binding var showSignInView: Bool
    
    @State var showPurchaseHistoryView = false
    @State var showAllAccountView = false
    @State var showDetailCheckingView = false
    @State var showDetailSavingsView = false
    @State var showDetailPlatinumView = false
    @State var showDetailCreditCardView = false
    @State var showDetailDebitView = false
    
    let myDarkGray: Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    let myLightGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
    let listGray: Color = Color(red: 242/255, green: 242/255, blue: 247/255)
    
    var body: some View {
        VStack (spacing: 0){
            HStack{
                Text("Dashboard")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .padding(.horizontal, 20)
                    .padding(.top, 15)
                Spacer()
            }
            List{
                Section(header: Text("Account")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 15))
                ){
                    AccountPreviewView()
                }
                Section{
                    Button{
                        showAllAccountView = true
                    } label: {
                        HStack{
                            Spacer()
                            Text("view account information")
                                .foregroundColor(.indigo)
                            Spacer()
                        }
                    }
                    .sheet(isPresented: $showAllAccountView, onDismiss: {showAllAccountView = false}){
                        AllAccountView(showAllAccountView: $showAllAccountView, showDetailCheckingView: $showDetailCheckingView, showDetailSavingsView: $showDetailSavingsView, showDetailPlatinumView: $showDetailPlatinumView, showDetailCreditCardView: $showDetailCreditCardView, showDetailDebitView: $showDetailDebitView)
                    }
                }
                .listRowSeparator(.hidden)
                Section(header: Text("Recent Purchases")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 15))
                ){
                    RecentPurchaseView()
                }
                Section{
                    Button{
                        showSignInView = false
                        showPurchaseHistoryView = true
                    } label: {
                        HStack{
                            Spacer()
                            Text("view all transactions")
                                .foregroundColor(.indigo)
                            Spacer()
                        }
                    }
                    .fullScreenCover(isPresented: $showPurchaseHistoryView){
                        NavigationStack{
                            HomeView(showSignInView: $showSignInView, showPurchaseHistoryView: $showPurchaseHistoryView, pageIndex: 1)
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .padding(.horizontal, 20)
            .background(.white)
            .listStyle(InsetListStyle())
        }
        .background(.white)
    }
}

struct MainPageScrollableView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageScrollableView(showSignInView: .constant(false))
    }
}
