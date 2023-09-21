//
//  AllAccountView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/20/23.
//

import SwiftUI

struct AllAccountView: View {
    @Binding var showAllAccountView: Bool
    
    @Binding var showDetailCheckingView: Bool
    @Binding var showDetailSavingsView: Bool
    @Binding var showDetailPlatinumView: Bool
    @Binding var showDetailCreditCardView: Bool
    @Binding var showDetailDebitView: Bool
    
    var checkingAmount = 1493.02
    var savingsAmount = 165.29
    var creditCard = 113.76
    
    var myDarkGray: Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    var myLightGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
    
    var body: some View {
        VStack{
            VStack{
                Text("Your Account")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.top, 25)
                Image("pearPayIcon")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .shadow(radius: 10)
                    .padding(.bottom, 15)
                //start of first account
                Button{
                    showDetailDebitView = false
                    showDetailSavingsView = false
                    showDetailPlatinumView = false
                    showDetailCreditCardView = false
                    showDetailCheckingView = true
                } label: {
                    HStack{
                        HStack{
                            Spacer()
                            Image(systemName: "building.columns.fill")
                                .resizable()
                                .frame(width: 32, height: 25)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 50, height: 50)
                        .background(.green)
                        .cornerRadius(10)
                        VStack (alignment: .leading){
                            Text("Checking")
                                .fontWeight(.semibold)
                            Text("123-456-789")
                                .foregroundColor(myDarkGray)
                                .padding(.top, 5)
                            Text("Vinton County National Bank (VCNB)")
                        }
                        .frame(height: 50)
                        .padding(.horizontal, 10)
                        Spacer()
                        VStack{
                            HStack{
                                Text("$\(checkingAmount, specifier: "%.2f")")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 5)
                            }
                        }
                        .frame(height: 50)
                    }
                    .padding(.top, 30)
                    //end of first account
                }
                .sheet(isPresented: $showDetailCheckingView, onDismiss: {showDetailCheckingView = false}){
                    DetailViewChecking(showDetailCheckingView: $showDetailCheckingView)
                        .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
                }
                Button{
                    showDetailDebitView = false
                    showDetailPlatinumView = false
                    showDetailCheckingView = false
                    showDetailCreditCardView = false
                    showDetailSavingsView = true
                } label: {
                    HStack{
                        HStack{
                            Spacer()
                            Image(systemName: "building.columns.fill")
                                .resizable()
                                .frame(width: 32, height: 25)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 50, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        VStack (alignment: .leading){
                            Text("Savings")
                                .fontWeight(.semibold)
                            Text("123-456-789")
                                .foregroundColor(myDarkGray)
                                .padding(.top, 5)
                            Text("Vinton County National Bank (VCNB)")
                        }
                        .frame(height: 50)
                        .padding(.horizontal, 10)
                        Spacer()
                        VStack{
                            HStack{
                                Text("$\(savingsAmount, specifier: "%.2f")")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 5)
                            }
                        }
                        .frame(height: 50)
                    }
                    .padding(.vertical, 40)
                    //end of second account
                }
                .sheet(isPresented: $showDetailSavingsView, onDismiss: {showDetailSavingsView = false}){
                    DetailViewSavings(showDetailSavingsView: $showDetailSavingsView)
                        .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
                }
                Button{
                    showDetailDebitView = false
                    showDetailSavingsView = false
                    showDetailCheckingView = false
                    showDetailPlatinumView = false
                    showDetailCreditCardView = true
                } label: {
                    HStack{
                        HStack{
                            Spacer()
                            Image(systemName: "creditcard.fill")
                                .resizable()
                                .frame(width: 32, height: 25)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 50, height: 50)
                        .background(.red)
                        .cornerRadius(10)
                        VStack (alignment: .leading){
                            Text("Credit Card")
                                .fontWeight(.semibold)
                            Text("1234-5678-9101-1231")
                                .foregroundColor(myDarkGray)
                                .padding(.top, 5)
                            Text("Vinton County National Bank (VCNB)")
                        }
                        .frame(height: 50)
                        .padding(.horizontal, 10)
                        Spacer()
                        VStack{
                            HStack{
                                Text("$\(creditCard, specifier: "%.2f")")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 5)
                            }
                        }
                        .frame(height: 50)
                    }
                    //end of third account
                }
                .sheet(isPresented: $showDetailCreditCardView, onDismiss: {showDetailCreditCardView = false}){
                    DetailViewCreditCard(showDetailCreditCardView: $showDetailCreditCardView)
                        .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
                }
                Button{
                    showDetailDebitView = false
                    showDetailSavingsView = false
                    showDetailCheckingView = false
                    showDetailCreditCardView = false
                    showDetailPlatinumView = true
                } label: {
                    HStack{
                        HStack{
                            Spacer()
                            Image(systemName: "creditcard.fill")
                                .resizable()
                                .frame(width: 32, height: 25)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 50, height: 50)
                        .background(.pink)
                        .cornerRadius(10)
                        VStack (alignment: .leading){
                            Text("Platinum Card")
                                .fontWeight(.semibold)
                            Text("1234-5678-9101-1231")
                                .foregroundColor(myDarkGray)
                                .padding(.top, 5)
                            Text("Vinton County National Bank (VCNB)")
                        }
                        .frame(height: 50)
                        .padding(.horizontal, 10)
                        Spacer()
                        VStack{
                            HStack{
                                Text("$20.13")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 5)
                            }
                        }
                        .frame(height: 50)
                    }
                    .padding(.vertical, 40)
                    //end of fourth account
                }
                .sheet(isPresented: $showDetailPlatinumView, onDismiss: {showDetailPlatinumView = false}){
                    DetailViewPlatinumCard(showDetailPlatinumView: $showDetailPlatinumView)
                        .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
                }
                Button{
                    showDetailPlatinumView = false
                    showDetailSavingsView = false
                    showDetailCheckingView = false
                    showDetailCreditCardView = false
                    showDetailDebitView = true
                } label: {
                    HStack{
                        HStack{
                            Spacer()
                            Image(systemName: "creditcard.fill")
                                .resizable()
                                .frame(width: 32, height: 25)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 50, height: 50)
                        .background(.purple)
                        .cornerRadius(10)
                        VStack (alignment: .leading){
                            Text("Debit Card")
                                .fontWeight(.semibold)
                            Text("1234-5678-9101-1231")
                                .foregroundColor(myDarkGray)
                                .padding(.top, 5)
                            Text("Vinton County National Bank (VCNB)")
                        }
                        .frame(height: 50)
                        .padding(.horizontal, 10)
                        Spacer()
                        VStack{
                            HStack{
                                Text("$22.42")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 5)
                            }
                        }
                        .frame(height: 50)
                    }
                    .padding(.bottom, 40)
                    //end of fifth account
                }
                .sheet(isPresented: $showDetailDebitView, onDismiss: {showDetailDebitView = false}){
                    DetailViewDebitCard(showDetailDebitView: $showDetailDebitView)
                        .presentationDetents([.fraction(0.45), .fraction(0.450000001)])
                }
            }
            .foregroundColor(.black)
            .padding(.horizontal, 50)
            Spacer()
            HStack{
                Spacer()
                Button{
                    
                } label: {
                    VStack{
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                        Text("Add an account")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(myDarkGray)
                    }
                }
                .padding(.trailing, 20)
                .padding(.bottom, 30)
            }
        }
    }
}

struct AllAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AllAccountView(showAllAccountView: .constant(false), showDetailCheckingView: .constant(false), showDetailSavingsView: .constant(false), showDetailPlatinumView: .constant(false), showDetailCreditCardView: .constant(false), showDetailDebitView: .constant(false))
    }
}
