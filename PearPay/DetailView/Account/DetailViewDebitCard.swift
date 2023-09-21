//
//  DetailViewDebitCard.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/21/23.
//

import SwiftUI

struct DetailViewDebitCard: View {
    @Binding var showDetailDebitView: Bool
    
    @State var nameOfAccount: String = "Debit Card"
    @State var nameOfBank:    String = "Vinton County National Bank (VCNB)"
    @State var cardNumber: String = "1234-5678-9101"
    @State var balanceAmount: Double = 22.42
    
    @State var accountName:   String = ""
    @State var bankName   :   String = ""
    @State var cardNum :   String = ""
    
    let myDarkGray: Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    
    @State var showEditView: Bool = false
    var body: some View {
        VStack{
            Button{
                withAnimation (.none){
                    showEditView.toggle()
                }
            } label: {
                HStack{
                    Spacer()
                    VStack{
                        if !showEditView{
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundColor(.black)
                            Text("Edit Account")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(myDarkGray)
                        }
                        else{
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                                .padding(.trailing, 15)
                            Text("Exit Edit Mode")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(myDarkGray)
                                .padding(.trailing, 15)
                        }
                    }
                }
                .animation(nil, value: showEditView)
                .scaleEffect(showEditView ? 1.1 : 1.0)
                .animation(.spring().speed(0.7), value: showEditView)
            }
            .padding(.trailing, 10)
            .padding(.top, 30)
            if (!showEditView){
                VStack{
                    Text("\(nameOfAccount)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    VStack (alignment: .leading){
                        Group{
                            Text("\(nameOfBank)")
                                .font(.custom("SF Pro", size: 24))
                            HStack{
                                Text("Card Number ")
                                    .font(.custom("SF Pro", size: 24))
                                Text("\(cardNumber)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                            HStack{
                                Text("Balance ")
                                    .font(.custom("SF Pro", size: 24))
                                Text("$\(balanceAmount, specifier: "%.2f")")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    .padding(.horizontal, 11)
                    Spacer()
                }
                .foregroundColor(.black)
                .onAppear(perform: {
                    if !accountName.isEmpty {
                        nameOfAccount = accountName
                    }
                    if !bankName.isEmpty {
                        nameOfBank = bankName
                    }
                    if !cardNum.isEmpty {
                        cardNumber = cardNum
                    }
                })
            }
            else{
                VStack{
                    TextField("Account Name...", text: $accountName)
                        .font(.custom("SF Pro", size: 24))
                    Spacer()
                    TextField("Bank Name...", text: $bankName)
                        .font(.custom("SF Pro", size: 24))
                    Spacer()
                    TextField("Card Number...", text: $cardNum)
                        .font(.custom("SF Pro", size: 24))
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal, 40)
                .foregroundColor(.black)
                .font(.title)
                Spacer()
            }
        }
    }
}

struct DetailViewDebitCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewDebitCard(showDetailDebitView: .constant(false))
    }
}
