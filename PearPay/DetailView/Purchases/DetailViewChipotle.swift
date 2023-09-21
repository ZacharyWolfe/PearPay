//
//  DetailViewChipotle.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/19/23.
//

import SwiftUI

struct DetailViewChipotle: View {
    let listGray: Color = Color(red: 242/255, green: 242/255, blue: 247/255)
    var body: some View {
        VStack{
            Image("Chipotle")
                .resizable()
                .clipShape(Circle())
                .frame(width: 120, height: 120)
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .padding(.top, 20)
            Text("Chipotle")
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.system(size: 25))
            VStack (alignment: .leading){
                HStack{
                    Image(systemName: "phone")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                    Link("Call Merchant", destination: URL(string: "tel:8002447685")!)
                }
                HStack{
                    Image(systemName: "globe.americas.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                    Link("Merchant Website",
                         destination: URL(string: "https://www.chipotle.com")!)
                }
            }
            .padding(.top, 20)
            HStack{
                HStack (alignment: .top){
                    VStack{
                        Text("Purchased Amount")
                            .font(.title)
                            .fontWeight(.medium)
                        Text("Gas/Grocery")
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Text("$14.53")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                }
                .padding(.horizontal, 15)
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(listGray)
            .padding(.top, 50)
            Spacer()
            VStack{
                HStack{
                    Spacer()
                    Button{
                        
                    } label: {
                        Spacer()
                        VStack{
                            Image(systemName: "exclamationmark.triangle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .fontWeight(.medium)
                                .foregroundColor(.orange)
                            Link("Report a problem", destination: URL(string: "tel:7406035371")!)
                                .foregroundColor(.black)
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                        .padding(.trailing, 30)
                        .padding(.bottom, 20)
                    }
                }
            }
        }
    }
}

struct DetailViewChipotle_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewChipotle()
    }
}
