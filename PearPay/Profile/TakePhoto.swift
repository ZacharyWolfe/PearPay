//
//  TakePhoto.swift
//  PearPay
//
//  Created by Zachary Wolfe on 8/20/23.
//

import SwiftUI

struct TakePhoto: View {
    @Binding var CameraImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ImagePickerViewController(TakePhotoImage: $CameraImage, presentationMode: _presentationMode)
    }
}

struct TakePhoto_Previews: PreviewProvider {
    static var previews: some View {
        TakePhoto(CameraImage: .constant(nil))
    }
}
struct ImagePickerViewController: UIViewControllerRepresentable {
    @Binding var TakePhotoImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        //The customizations for the camera
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        //Changing the defaults of the camera to be native to the user
        picker.sourceType = .camera
        picker.cameraFlashMode = .off
        picker.cameraCaptureMode = .photo //Cant use video, etc.
        picker.videoQuality = .typeHigh
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerViewController

        init(_ parent: ImagePickerViewController) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            //Take the photo
            if let image = info[.originalImage] as? UIImage {
                parent.TakePhotoImage = image
            }
            //Cancel button
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            //Cancel button
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

