//
//  HeaderView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/8/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseStorage

struct HeaderView: View {
    @Binding var showSignInView: Bool
    @Binding var pageIndex: Int
    @Binding var showPurchaseHistoryView: Bool
    
    @State var profilePhoto: UIImage = UIImage()
    @State var showProfileView: Bool = false
    @State var selectedImage: UIImage? = nil
    @State var showSettingsView: Bool = false
    
    var myLightGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
    var listGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
    
    var body: some View {
        VStack (spacing: 0){
            HStack{
                if(pageIndex != 0){
                    NavigationLink(destination: HomeView(showSignInView: $showSignInView, showPurchaseHistoryView: $showPurchaseHistoryView, pageIndex: 0).navigationBarBackButtonHidden(true)){
                        Image("pearPayIcon")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .shadow(radius: 10)
                    }
                }
                else{
                    NavigationLink(destination: SettingsView(showSignInView: $showSignInView)){
                        Image("pearPayIcon")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .shadow(radius: 10)
                    }
                }
                Spacer()
                Button {
                    showProfileView = true
                } label: {
                    Image(uiImage: profilePhoto)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                            .overlay {
                                Circle().stroke(.blue, lineWidth: 2)
                            }
                    }
                    .shadow(radius: 7)
                }
            }
            .padding(.top, 15)
            .padding(.horizontal, 20)
        }
        .onAppear{
            let db = Firestore.firestore()
            
            db.collection("Images").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents{
                        if let imageData = document.data()["url"] as? String, !imageData.isEmpty{
                            let storageRef = Storage.storage().reference().child(imageData)
                            storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                                if let error = error {
                                    print("Error downloading image: \(error)")
                                } else if let data = data, let image = UIImage(data: data) {
                                    DispatchQueue.main.async {
                                        profilePhoto = image
                                    }
                                } else {
                                    if let newphoto = UIImage(named: "Image"){
                                        profilePhoto = newphoto
                                    }
                                }
                            }
                        } 
                        else {
                            if let newphoto = UIImage(named: "Image"){
                                profilePhoto = newphoto
                            }
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showSettingsView){
                SettingsView(showSignInView: $showSignInView)
        }
        .fullScreenCover(isPresented: $showProfileView){
            NavigationStack{
                ProfileView(showProfileView: $showProfileView, profilePhoto: $profilePhoto, selectedImage: $selectedImage)
            }
        }
//        Color(red: 233/255, green: 30/255, blue: 99/255)
        .background(.white)
        .frame(height: 135)
        .frame(maxWidth: .infinity)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showSignInView: .constant(false),pageIndex: .constant(0), showPurchaseHistoryView: .constant(false), profilePhoto: UIImage())
    }
}
