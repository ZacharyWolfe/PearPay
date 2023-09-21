//
//  ButtonExpandView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 9/2/23.
//

import SwiftUI
import StripeCardScan

struct ButtonExpandView: View {
    let listGray: Color = Color(red: 242/255, green: 242/255, blue: 247/255)
    let myDarkGray: Color = Color(red: 153/255, green: 153/255, blue: 153/255)
    
    @Binding var hasAddedCard: Bool
    @Binding var isMenuVisible: Bool
    @Binding var isRolling: Bool
    
    @State var addCardView = false
    @State var scannedCard: CardScanSheetResult?
    
    var body: some View {
        VStack (spacing: 15){
            Spacer()
            if isRolling{
                VStack{
                    Button{
                        addCardView = true
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: "creditcard.and.123")
                                .resizable()
                                .frame(width: 30, height: 25)
                                .foregroundColor(.white)
                        }
                    }
                    .sheet(isPresented: $addCardView, onDismiss: {addCardView = false}){
                        PearPayAddCardView(addCardView: $addCardView)
                    }
                }
                Button{
                    cardScanSheetButtonPressed()
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(.red)
                            .frame(width: 60, height: 60)
                        Image(systemName: "creditcard.viewfinder")
                            .resizable()
                            .frame(width: 30, height: 25)
                            .foregroundColor(.white)
                    }
                }
            }
            Image(systemName: isRolling ? "xmark.circle" : "plus.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
                .rotationEffect(.degrees(isRolling ? 90 : 0))
                .animation(.easeInOut(duration: 0.25), value: isRolling)
            isRolling ? Text("Close").font(.caption).fontWeight(.semibold).foregroundColor(myDarkGray) : Text("Add to wallet").font(.caption).fontWeight(.semibold).foregroundColor(myDarkGray)
        }
        .padding(.bottom, 20)
    }
    func cardScanSheetButtonPressed(){
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let rootViewController = windowScene.windows.first?.rootViewController {
        let cardScanSheet = CardScanSheet()
        cardScanSheet.present(from: rootViewController) { result in
                switch result {
                    case .completed(let scannedCard):
                        // Handling a successfully scanned card
                        hasAddedCard = true
                        print("Scan success. Card details: \(scannedCard)")
                    case .canceled:
                        // Handling the user canceling the scan
                        print("Scan canceled")
                        return
                    case .failed(let error):
                        // Handling a scan failure
                        print("Scan failed: \(error.localizedDescription)")
                        return
                }
            }
        }
    }
}

