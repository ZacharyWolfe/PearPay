//
//  EditProfilePictureView.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/12/23.
//

import SwiftUI
import PhotosUI
import FirebaseFirestore
import FirebaseStorage

struct EditProfilePictureView: View {
    @Binding var profilePhoto: UIImage //Your overall profile photo
    @Binding var showEditProfilePicture: Bool //The sheet that popsup when you press edit profile
    
    //ImagePicker Variables
    @State var isImagePickerPresented = false
    @State var photoItem: PhotosPickerItem? //The selected photo you chose in the library
    @Binding var selectedImageData: Data? //The data from this photoItem
    @State var selectedImage: UIImage? //The image that gets translated from the ImageData
    
    //Camera Variables
    @Binding var TakePhotoImage: UIImage?
    @Binding var CameraImage: UIImage?
    
    @State var removePhoto = false
    
    let myLightGray: Color = Color(red: 240/255, green: 246/255, blue: 249/255)
    
    var body: some View {
        Spacer()
        VStack (spacing: 15){
            //"Choose From Library" option to select a photo from your camera roll
            ImagePicker(selectedImageData: $selectedImageData, photoItem: $photoItem)
            
            //Take a photo with your camera
            Button{
                isImagePickerPresented = true
            } label: {
                HStack (spacing: 15){
                    Image(systemName: "camera.on.rectangle")
                    Text("Take photo")
                    Spacer()
                }
            }
            .padding(.vertical, 20)
            .fullScreenCover(isPresented: $isImagePickerPresented) {
                TakePhoto(CameraImage: $CameraImage)
                    .ignoresSafeArea()
            }
            
            //Remove your current photo
            Button{
                profilePhoto = UIImage()
                removePhoto = true
            } label: {
                HStack (spacing: 15){
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                        .padding(.leading, 5)
                    Text("Remove current photo")
                        .padding(.leading, 5)
                    Spacer()
                }
            }
            .onChange(of: removePhoto){ newValue in
                if removePhoto{
                    do{
                        //Get the databse
                        let db = Firestore.firestore()
                        
                        //Query the collection 'Images' for its documents
                        db.collection("Images").getDocuments() { (querySnapshot, err) in
                            if let error = err {
                                print("Error fetching documents: \(error.localizedDescription)")
                                return
                            }

                            // Loop through the documents and delete each one from the requested query
                            for document in querySnapshot?.documents ?? [] {
                                //Get a reference to a specific document in all documents
                                let documentReference = db.collection("Images").document(document.documentID)
                                //Delete it
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
        .fontWeight(.medium)
        .font(.system(size: 20))
        .padding(.leading, 20)
        .foregroundColor(.black)
        Spacer()
    }
}
