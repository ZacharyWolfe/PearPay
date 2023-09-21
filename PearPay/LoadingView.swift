//
//  LoadingView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 9/3/23.
//

import SwiftUI

struct LoadingView: View {
    @State var isLoading = true
    @State var isRolling = false
    
    var body: some View {
        VStack{
            if isLoading{
                VStack{
                    Text("Pear Pay")
                        .foregroundColor(.white)
                        .font(.custom("Helvetica Neue", size: 36))
                        .fontWeight(.bold)
                }
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity)
                .background(Color(red: 233/255, green: 30/255, blue: 99/255))
            }
            else{
                OnboardingMainView()
            }
        }
        //A timer for the loading view
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                isLoading = false
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
