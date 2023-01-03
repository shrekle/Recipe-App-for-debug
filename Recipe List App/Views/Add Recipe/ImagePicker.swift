//
//  ImagePicker.swift
//  Recipe List App
//
//  Created by adrian garcia on 1/2/23.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    var selectedImageSource: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = context.coordinator
        
        //  bby defalut UIImagePickerController is set to PhotoLibrary but just in case its a good idea to set it
        imagePickerController.sourceType = selectedImageSource
        
         return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
//     makeCoordinator eigther makes a coordinator or accesses one that has already been made or initialized, thats why we have a coordinator  class below
    func makeCoordinator() -> Coordinator {
        
    }
    
    static func dismantleUIViewController(_ uiViewController: UIImagePickerController, coordinator: ()) {
        <#code#>
    }
    
    //          the coordinator's parent is the ImagePicker struct
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
//        dont forget to set the coordinators delegatein the makeUIViewController func in the imagePicker struct like so:
//                 let imagePickerController = UIImagePickerController()
//                 imagePickerController.delegate = context.coordinator
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
    }
}
