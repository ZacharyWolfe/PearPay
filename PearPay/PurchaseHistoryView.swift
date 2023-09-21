//
//  PurchaseHistoryView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/8/23.
//

import SwiftUI

struct PurchaseHistoryView: View {
    var body: some View {
        VStack(spacing: 0){
            AllPurchaseHistoryView()
            VStack{
                Text("$156.31")
                    .font(.custom("Helvetica Neue", size: 30))
                    .fontWeight(.semibold)
                Text("Current Balance.")
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 10)
            .padding(.trailing, 10)
        }
    }
}

struct PurchaseHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseHistoryView()
    }
}
