//
//  CardsView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/17/23.
//

import SwiftUI

struct CardsView: View {
    let listGray: Color = Color(red: 242/255, green: 242/255, blue: 247/255)
    let myDarkGray: Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    
    @State var isMenuVisible = false
    @State var hasAddedCard = false
    @State var isRolling = false
    
    @State var showDetailCreditCardView = false
    @State var showDetailDebitCardView = false
    @State var showDetailPlatinumCardView = false
    @State var showDetailCreditCard2View = false
    var body: some View {
        VStack{
            HStack{
                Text("Wallet")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .padding(.horizontal, 20)
                    .padding(.top, 15)
                Spacer()
            }
            HStack{
                Button{
                    showDetailCreditCardView.toggle()
                } label: {
                    VStack (spacing: 0){
                        Text("Credit Card")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        HStack{
                            Image("CC")
                                .resizable()
                                .frame(width: 150, height: 100)
                        }
                        .frame(width: 150, height: 100)
                    }
                }
                .sheet(isPresented: $showDetailCreditCardView, onDismiss: {showDetailCreditCardView = false}){
                    DetailViewCreditCard(showDetailCreditCardView: $showDetailCreditCardView)
                        .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
                }
                Button{
                    showDetailDebitCardView.toggle()
                } label: {
                    VStack (spacing: 0){
                        Text("Debit Card")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        HStack{
                            Image("CC2")
                                .resizable()
                                .frame(width: 150, height: 100)
                        }
                        .frame(width: 150, height: 100)
                    }
                }
                .sheet(isPresented: $showDetailDebitCardView, onDismiss: {showDetailDebitCardView = false}){
                    DetailViewDebitCard(showDetailDebitView: $showDetailDebitCardView)
                        .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
                }
            }
            .padding(.top, 30)
            HStack{
                Button{
                    showDetailPlatinumCardView.toggle()
                } label: {
                    VStack (spacing: 0){
                        Text("Platinum Card")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        HStack{
                            Image("CC3")
                                .resizable()
                                .frame(width: 150, height: 100)
                        }
                        .frame(width: 150, height: 100)
                    }
                }
                .sheet(isPresented: $showDetailPlatinumCardView, onDismiss: {showDetailPlatinumCardView = false}){
                    DetailViewPlatinumCard(showDetailPlatinumView: $showDetailPlatinumCardView)
                        .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
                }
                if !hasAddedCard{
                    Button{
                        showDetailCreditCard2View.toggle()
                    } label: {
                        VStack (spacing: 0){
                            Text("Credit Card")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                            HStack{
                                Image("CC")
                                    .resizable()
                                    .frame(width: 150, height: 100)
                            }
                            .frame(width: 150, height: 100)
                        }
                        .opacity(0)
                    }
                    .sheet(isPresented: $showDetailCreditCard2View, onDismiss: {showDetailCreditCard2View = false}){
                        DetailViewCreditCard2(showDetailCreditCardView: $showDetailCreditCard2View)
                            .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
                    }
                }
                else{
                    Button{
                        
                    } label: {
                        VStack (spacing: 0){
                            Text("Credit Card")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                            HStack{
                                Image("CC4")
                                    .resizable()
                                    .frame(width: 150, height: 100)
                            }
                            .frame(width: 150, height: 100)
                            .cornerRadius(10)
                        }
                    }
                }
            }
            Spacer()
            HStack{
                Spacer()
                Button{
                    isRolling.toggle()
                } label: {
                    VStack{
                        ButtonExpandView(hasAddedCard: $hasAddedCard, isMenuVisible: $isMenuVisible, isRolling: $isRolling)
                    }
                }
                .padding(.trailing, 20)
            }
        }
        .background(.white)
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
