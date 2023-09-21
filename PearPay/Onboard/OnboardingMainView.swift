//
//  OnboardingMainView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 9/2/23.
//

import SwiftUI
import FirebaseFirestore

struct OnboardingMainView: View {
    @State var showRootView = false
    @State var pageIndex = 0
    
    @State private var showSignInView: Bool = false
    @State private var showingSignInEmailView: Bool = false
    @State private var showingSignUpEmailView: Bool = false
    @State private var showPurchaseHistoryView: Bool = false
    
    var body: some View {
        VStack{
            if !UserDefaults.standard.bool(forKey: "hasCompletedOnboarding"){
                TabView (selection: $pageIndex){
                    FirstPageOnboard().tag(0)
                    SecondPageOnboard().tag(1)
                    ThirdPageOnboard().tag(2)
                    FourthPageOnboard().tag(3)
                    FinalPageOnboard().tag(4)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(maxWidth: .infinity)
                .onAppear{
                    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color(red: 233/255, green: 30/255, blue: 99/255))
                    UIPageControl.appearance().pageIndicatorTintColor = .systemGray3
                }
                Button{
                    if pageIndex < 4 {
                        pageIndex += 1
                    }
                    else{
                        showRootView = true
                    }
                } label: {
                    HStack{
                        Text(pageIndex < 4 ? "Next" : "Sounds Good!")
                            .foregroundColor(.white)
                    }
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 233/255, green: 30/255, blue: 99/255))
                    .cornerRadius(15)
                    .padding(.top, 30)
                    .padding(.horizontal, 20)
                }
                .fullScreenCover(isPresented: $showRootView){
                    RootView(showSignInView: $showSignInView, showingSignInEmailView: $showingSignInEmailView, showingSignUpEmailView: $showingSignUpEmailView, showPurchaseHistoryView: $showPurchaseHistoryView)
                }
            }
            else{
                RootView(showSignInView: $showSignInView, showingSignInEmailView: $showingSignInEmailView, showingSignUpEmailView: $showingSignUpEmailView, showPurchaseHistoryView: $showPurchaseHistoryView)
            }
        }
        .onAppear{
            UserDefaults.standard.set(false, forKey: "hasCompletedOnboarding")
            do{
                //Get a reference to the database
                let db = Firestore.firestore()
                
                //Get the collection named 'Images' and query for it's documents
                db.collection("Images").getDocuments() { (querySnapshot, err) in
                    //If there is an error in querying for documents
                    if let error = err {
                        print("Error fetching documents: \(error.localizedDescription)")
                        return
                    }

                    // Loop through the received documents and delete each one upon reloading the app (enables showing the application to many people from the beginning)
                    for document in querySnapshot?.documents ?? [] {
                        //Actually getting the documents from 'Images' by specified ID
                        let documentReference = db.collection("Images").document(document.documentID)
                        //Delete the given document
                        documentReference.delete { error in
                            if let error = error {
                                print("Error deleting document: \(error.localizedDescription)")
                            } else {
                                print("Document successfully deleted.")
                            }
                        }
                    }
                }
            }
        }
        
//Error displaying the root view 
//        VStack{
//            if !UserDefaults.standard.bool(forKey: "hasCompletedOnboarding"){
//                TabView (selection: $pageIndex){
//                    FirstPageOnboard().tag(0)
//                    SecondPageOnboard().tag(1)
//                    ThirdPageOnboard().tag(2)
//                    FourthPageOnboard().tag(3)
//                    FinalPageOnboard().tag(4)
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
//                .frame(maxWidth: .infinity)
//                .onAppear{
//                    UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
//                    UIPageControl.appearance().pageIndicatorTintColor = .systemGray3
//                }
//                if pageIndex < 4{
//                    Button{
//                        pageIndex += 1
//                    } label: {
//                        HStack{
//                            Text("Next")
//                                .foregroundColor(.white)
//                        }
//                        .font(.headline)
//                        .frame(height: 55)
//                        .frame(maxWidth: .infinity)
//                        .background(Color(red: 233/255, green: 30/255, blue: 99/255))
//                        .cornerRadius(15)
//                        .padding(.top, 30)
//                        .padding(.horizontal, 20)
//                    }
//                }
//                else{
//                    Button{
//                        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
//                        showRootView = true
//                    } label: {
//                        HStack{
//                            Text("Sounds Good!")
//                                .foregroundColor(.white)
//                        }
//                        .font(.headline)
//                        .frame(height: 55)
//                        .frame(maxWidth: .infinity)
//                        .background(Color(red: 233/255, green: 30/255, blue: 99/255))
//                        .cornerRadius(15)
//                        .padding(.top, 30)
//                        .padding(.horizontal, 20)
//                    }
//                    if showRootView{
//                        NavigationStack{
//                            RootView(showSignInView: $showSignInView, showingSignInEmailView: $showingSignInEmailView, showingSignUpEmailView: $showingSignUpEmailView, showPurchaseHistoryView: $showPurchaseHistoryView)
//                        }
//                    }
//                }
//            }
//            else{
//                RootView(showSignInView: $showSignInView, showingSignInEmailView: $showingSignInEmailView, showingSignUpEmailView: $showingSignUpEmailView, showPurchaseHistoryView: $showPurchaseHistoryView)
//            }
//        }
//        .padding(.bottom, 30)
//        .background(.white)
//        .onAppear{
//            UserDefaults.standard.set(false, forKey: "hasCompletedOnboarding")
//            print("Set to false")
//        }
    }
}
