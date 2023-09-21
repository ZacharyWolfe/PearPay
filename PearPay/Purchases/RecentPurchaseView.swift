//
//  RecentPurchaseView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/9/23.
//

import SwiftUI

struct RecentPurchaseView: View {
    
    var myDarkGray: Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    var myLightGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
    var body: some View {
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
            .background(myDarkGray)
            .cornerRadius(10)
            VStack (alignment: .leading){
                Text("Credit Card")
                    .fontWeight(.semibold)
                Text("BP")
                    .foregroundColor(myDarkGray)
                    .padding(.top, 5)
            }
            .frame(height: 50)
            .padding(.horizontal, 10)
            Spacer()
            VStack{
                HStack{
                    NavigationLink(destination: DetailViewBP()){
                        HStack{
                            Spacer()
                            Text("$7.89")
                                .fontWeight(.bold)
                                .padding(.horizontal, 5)
                        }
                    }
                }
            }
            .frame(height: 50)
        }
//        end of first purchase
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
                Text("Credit Card")
                    .fontWeight(.semibold)
                Text("Speedway")
                    .foregroundColor(myDarkGray)
                    .padding(.top, 5)
            }
            .frame(height: 50)
            .padding(.horizontal, 10)
            Spacer()
            VStack{
                HStack{
                    NavigationLink(destination: DetailViewSpeedway()){
                        HStack{
                            Spacer()
                            Text("$31.29")
                                .fontWeight(.bold)
                                .padding(.horizontal, 5)
                        }
                    }
                }
            }
            .frame(height: 50)
        }
//        end of second purchase
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
                Text("Sunoco")
                    .foregroundColor(myDarkGray)
                    .padding(.top, 5)
            }
            .frame(height: 50)
            .padding(.horizontal, 10)
            Spacer()
            VStack{
                HStack{
                    NavigationLink(destination: DetailViewSunoco()){
                        HStack{
                            Spacer()
                            Text("$10.15")
                                .fontWeight(.bold)
                                .padding(.horizontal, 5)
                        }
                    }
                }
            }
            .frame(height: 50)
        }
//        end of third purchase
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
            .background(.orange)
            .cornerRadius(10)
            VStack (alignment: .leading){
                Text("Credit Card")
                    .fontWeight(.semibold)
                Text("Buffalo Wild Wings")
                    .foregroundColor(myDarkGray)
                    .padding(.top, 5)
            }
            .frame(height: 50)
            .padding(.horizontal, 10)
            Spacer()
            VStack{
                HStack{
                    NavigationLink(destination: DetailViewBWW()){
                        HStack{
                            Spacer()
                            Text("$51.67")
                                .fontWeight(.bold)
                                .padding(.horizontal, 5)
                        }
                    }
                }
            }
            .frame(height: 50)
        }
//        end of fourth purchase
    }
}

struct RecentPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        RecentPurchaseView()
    }
}
