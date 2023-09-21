//
//  AccountPreviewView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/26/23.
//

import SwiftUI

struct AccountPreviewView: View {
    
    var checkingAmount = 1493.02
    var savingsAmount = 165.29
    var creditCard = 113.76
    
    var myDarkGray: Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    var myLightGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
    
    var body: some View {
//        start of first account
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
            }
            .frame(height: 50)
            .padding(.horizontal, 10)
            Spacer()
            VStack{
                HStack{
                    Spacer()
                    Text("$\(checkingAmount, specifier: "%.2f")")
                        .fontWeight(.bold)
                        .padding(.horizontal, 5)
                }
            }
            .frame(height: 50)
        }
//        end of first account
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
            }
            .frame(height: 50)
            .padding(.horizontal, 10)
            Spacer()
            VStack{
                HStack{
                    Spacer()
                    Text("$\(savingsAmount, specifier: "%.2f")")
                        .fontWeight(.bold)
                        .padding(.horizontal, 5)
                }
            }
            .frame(height: 50)
        }
//        end of second account
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
            }
            .frame(height: 50)
            .padding(.horizontal, 10)
            Spacer()
            VStack{
                HStack{
                    Spacer()
                    Text("$\(creditCard, specifier: "%.2f")")
                        .fontWeight(.bold)
                        .padding(.horizontal, 5)
                }
            }
            .frame(height: 50)
        }
//        end of third account
    }
}
struct AccountPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        AccountPreviewView()
    }
}
