//
//  PaymentView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/17/23.
//

import SwiftUI
//import SWIFTNFC

struct PaymentView: View {
    @Binding var showingPaymentView: Bool
//    @ObservedObject var NFCR = NFCReader()
//    @ObservedObject var NFCW = NFCWriter()
    var body: some View {
        VStack{
            Spacer()
            Text("Sorry, no NFC here. (Apple developer required) :(")
                .fontWeight(.medium)
            Spacer()
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(showingPaymentView: .constant(false))
    }
}
