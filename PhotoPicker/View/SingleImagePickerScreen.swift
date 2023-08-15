//
//  SingleImagePickerScreen.swift
//  PhotoPicker
//
//  Created by Kentaro Mihara on 2023/08/15.
//

import Foundation
import SwiftUI

struct SingleImagePickerScreen: View {
    @State private var image:Image?
    @State private var inputImage:UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFit()
            Button {
                showingImagePicker = true
            } label: {
                Text("Select Image")
            }
         //Button triggers ImagePicker
        }.sheet(isPresented: $showingImagePicker) {
            ImagePickerView(image: $inputImage)
        }//if inputImage chagnes, loadImage to show it
        .onChange(of: inputImage) { newValue in
            loadImage()
        }
    }
    
    // showing image
    func loadImage(){
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}
