//
//  PearPayApp.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/7/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

@main
struct PearPayApp: App {
    init(){
        FirebaseApp.configure()
        print("Configured Firebase!")
    }
    
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}
