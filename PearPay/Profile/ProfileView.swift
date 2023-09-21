//
//  ProfileView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/9/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseStorage


struct ProfileView: View {
    @Binding var showProfileView: Bool
    @State var showEditProfilePicture: Bool = false
    
    @Binding var profilePhoto: UIImage
    @State var selectedImageData: Data? = nil
    @Binding var selectedImage: UIImage?
        
    @State private var TakePhotoImage: UIImage? = UIImage()
    @State private var CameraImage: UIImage? = UIImage()
    
    @State private var imageUrl: URL?
    @State var removePhoto = false
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    showProfileView = false
                } label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                }
                Spacer()
                Text("Edit Profile")
                    .font(.custom("SF Pro", size: 20))
                Spacer()
                Button{
                    Task{
                        do{
                            if let selectedImageData,
                                let selectedImage = UIImage(data: selectedImageData){
                                if TakePhotoImage != UIImage(){
                                    if let TakePhotoImage = TakePhotoImage{
                                        profilePhoto = TakePhotoImage
                                        print("Set Profile Photo To TakePhotoImage")
                                    }
                                }
                                profilePhoto = selectedImage
                                print("Set Profile Photo To SelectedImage")
                                
                                let storageRef = Storage.storage().reference()
                                
                                let imageData = selectedImage.jpegData(compressionQuality: 0.8)
                                
                                guard imageData != nil else{
                                    print("Library Image2")
                                    return
                                }
                                let path = "Images/\(Int(Date().timeIntervalSince1970)).jpg"
                                let fileRef = storageRef.child(path)
                                
                                fileRef.putData(imageData!, metadata: nil) { metadata, error in
                                    if error == nil && metadata != nil {
                                        let db = Firestore.firestore()
                                        db.collection("Images").document().setData(["url":path])
                                    }
                                }
                                removePhoto = true
                                TakePhotoImage = nil
                                showProfileView = false
                            }
                        }
                        do {
                            guard CameraImage != nil else {
                                print("Camera Image1")
                                return
                            }
                            
                            if CameraImage != UIImage(){
                                if let CameraImage = CameraImage{
                                    profilePhoto = CameraImage
                                    print("Set Profile Photo To CameraImage")
                                    let storageRef = Storage.storage().reference()
                                    
                                    let imageData = CameraImage.jpegData(compressionQuality: 0.8)
                                    
                                    guard imageData != nil else{
                                        print("Camera Image2")
                                        return
                                    }
                                    let path = "Images/\(UUID().uuidString).jpg"
                                    let fileRef = storageRef.child(path)
                                    
                                    fileRef.putData(imageData!, metadata: nil) { metadata, error in
                                        if error == nil && metadata != nil {
                                            let db = Firestore.firestore()
                                            db.collection("CameraImage").document().setData(["url":path])
                                        }
                                    }
                                    removePhoto = true
                                }
                            }
                            CameraImage = nil
                            showProfileView = false
                        }
                    }
                } label: {
                    Text("Done")
                        .fontWeight(.medium)
                }
                .onChange(of: removePhoto){ newValue in
                    if removePhoto{
                        do{
                            let db = Firestore.firestore()
                            
                            db.collection("Images").getDocuments() { (querySnapshot, err) in
                                if let error = err {
                                    print("Error fetching documents: \(error.localizedDescription)")
                                    return
                                }

                                // Loop through the documents and delete each one
                                for document in querySnapshot?.documents ?? [] {
                                    let documentReference = db.collection("Images").document(document.documentID)
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
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 25)
            if profilePhoto == UIImage(){
                Image(uiImage: profilePhoto)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 90, height: 90)
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                            .overlay {
                                Circle().stroke(.blue, lineWidth: 2)
                            }
                    }
                    .shadow(radius: 7)
                    .padding(.top, 20)
            }
            else if let selectedImageData,
               let selectedImage = UIImage(data: selectedImageData){
                Image(uiImage: selectedImage)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 90, height: 90)
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                            .overlay {
                                Circle().stroke(.blue, lineWidth: 2)
                            }
                    }
                    .shadow(radius: 7)
                    .padding(.top, 20)
            }
            else if (TakePhotoImage != UIImage()) {
                if let TakePhotoImage = TakePhotoImage{
                    Image(uiImage: TakePhotoImage)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 90, height: 90)
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                                .overlay {
                                    Circle().stroke(.blue, lineWidth: 2)
                                }
                        }
                        .shadow(radius: 7)
                        .padding(.top, 20)
                }
            }
            else if (CameraImage != UIImage()){
                if let CameraImage = CameraImage{
                    Image(uiImage: CameraImage)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 90, height: 90)
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                                .overlay {
                                    Circle().stroke(.blue, lineWidth: 2)
                                }
                        }
                        .shadow(radius: 7)
                        .padding(.top, 20)
                }
            }
            else{
                Image(uiImage: profilePhoto)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 90, height: 90)
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                            .overlay {
                                Circle().stroke(.blue, lineWidth: 2)
                            }
                    }
                    .shadow(radius: 7)
                    .padding(.top, 20)
            }
            Button{
                showEditProfilePicture = true
            }label: {
                Text("Edit profile picture")
            }
            Spacer()
        }
        .padding(.top, 5)
        .sheet(isPresented: $showEditProfilePicture, onDismiss: {showEditProfilePicture = false}) {
            EditProfilePictureView(profilePhoto: $profilePhoto, showEditProfilePicture: $showEditProfilePicture, selectedImageData: $selectedImageData, TakePhotoImage: $TakePhotoImage, CameraImage: $CameraImage)
                .presentationDetents([.fraction(0.40), .fraction(0.45)])
        }
        .onAppear{
            print("In on appear")
            if TakePhotoImage != UIImage(){
                if let TakePhotoImage = TakePhotoImage{
                    profilePhoto = TakePhotoImage
                    print("Set Profile Photo To TakePhotoImage")
                }
            }
            else if selectedImage != nil{
                if let selectedImage = selectedImage{
                    profilePhoto = selectedImage
                    print("Set Profile Photo To SelectedImage")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showProfileView: .constant(false), profilePhoto: .constant(UIImage()), selectedImage: .constant(nil))
    }
}
