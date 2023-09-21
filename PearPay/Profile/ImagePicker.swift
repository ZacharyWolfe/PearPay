//
//  ImagePicker.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/20/23.
//

import SwiftUI
import PhotosUI

struct ImagePicker: View {
    @Binding var selectedImageData: Data?
    @Binding var photoItem: PhotosPickerItem?
    
    var body: some View {
        VStack{
            //Use photopicker to choose an image from your library
            PhotosPicker(
                selection: $photoItem,
                matching: .images,
                photoLibrary: .shared()){
                    HStack (spacing: 15){
                        Image(systemName: "photo.stack")
                        Text("Choose from library")
                        Spacer()
                    }
            }
            .onChange(of: photoItem) { newItem in
                Task {
                    //Retrive selected asset in the form of Data
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
        }
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(selectedImageData: .constant(nil), photoItem: .constant(.none))
    }
}
