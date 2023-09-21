//
//  AllPurchaseHistoryView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/17/23.
//

import SwiftUI

struct AllPurchaseHistoryView: View {
    var body: some View {
        let myDarkGray: Color = Color(red: 153/255, green: 153/255, blue: 153/255)
        //        let myLightGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
        VStack(spacing: 0){
            HStack{
                Text("History")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                    .padding(.horizontal, 20)
                    .padding(.top, 15)
                Spacer()
            }
            HStack{
                Spacer()
                Button{
                    
                } label: {
                    Text("Make a payment")
                        .font(.subheadline)
                        .foregroundColor(.indigo)
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal, 20)
        }
        .background(.white)
        List{
            Section(header: Text("August 20")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .font(.system(size: 15))
                .listRowInsets(EdgeInsets(top: 0,leading: 0,bottom: -80,trailing: 0))
            ){
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
                        Text("Debit Card")
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
            }
            Section(header: Text("August 15")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .font(.system(size: 15))
                .listRowInsets(EdgeInsets(top: 0,leading: 0,bottom: -80,trailing: 0))
            ){
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
                    .background(.blue)
                    .cornerRadius(10)
                    VStack (alignment: .leading){
                        Text("Debit Card")
                            .fontWeight(.semibold)
                        Text("Chipotle Mexican Grill")
                            .foregroundColor(myDarkGray)
                            .padding(.top, 5)
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 10)
                    Spacer()
                    VStack{
                        HStack{
                            NavigationLink(destination: DetailViewChipotle()){
                                HStack{
                                    Spacer()
                                    Text("$14.53")
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                    }
                    .frame(height: 50)
                }
            }
            Section(header: Text("August 1")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .font(.system(size: 15))
                .listRowInsets(EdgeInsets(top: 0,leading: 0,bottom: -80,trailing: 0))
            ){
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
                    .background(.green)
                    .cornerRadius(10)
                    VStack (alignment: .leading){
                        Text("Credit Card")
                            .fontWeight(.semibold)
                        Text("Spotify")
                            .foregroundColor(myDarkGray)
                            .padding(.top, 5)
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 10)
                    Spacer()
                    VStack{
                        HStack{
                            NavigationLink(destination: DetailViewSpotify()){
                                HStack{
                                    Spacer()
                                    Text("$10.66")
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                    }
                    .frame(height: 50)
                }
                HStack{
                    HStack{
                        Spacer()
                        Image(systemName: "creditcard.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 32, height: 25)
                        Spacer()
                    }
                    .frame(width: 50, height: 50)
                    .background(.pink)
                    .cornerRadius(10)
                    VStack (alignment: .leading){
                        Text("Platinum Plus Card")
                            .fontWeight(.semibold)
                        Text("Cinemark Theatres")
                            .foregroundColor(myDarkGray)
                            .padding(.top, 5)
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 10)
                    Spacer()
                    VStack{
                        HStack{
                            NavigationLink(destination: DetailViewCinemark()){
                                HStack{
                                    Spacer()
                                    Text("$20.13")
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                    }
                    .frame(height: 50)
                }
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
                        Text("Discord Nitro Monthly")
                            .foregroundColor(myDarkGray)
                            .padding(.top, 5)
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 10)
                    Spacer()
                    VStack{
                        HStack{
                            NavigationLink(destination: DetailViewDiscord()){
                                HStack{
                                    Spacer()
                                    Text("$9.99")
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                    }
                    .frame(height: 50)
                }
            }
        }
        .padding(.horizontal, 20)
        .background(.white)
        .listStyle(InsetListStyle())
    }
}

struct AllPurchaseHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        AllPurchaseHistoryView()
    }
}
