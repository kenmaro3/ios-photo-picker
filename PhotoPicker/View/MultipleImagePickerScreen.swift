//
//  MultipleImagePickerScreen.swift
//  PhotoPicker
//
//  Created by Kentaro Mihara on 2023/08/15.
//

import Foundation
import SwiftUI

struct MultipleImagePickerScreen: View {
    @State private var images:[Image] = []
    @State private var inputImages:[UIImage] = []
    @State private var showingImagePicker = false
    
    var body: some View {
        ScrollView{
            VStack{
//                if(images.count > 0){
//                    images[0]
//                        .resizable()
//                        .scaledToFit()
//                }
                Button {
                    showingImagePicker = true
                } label: {
                    Text("Select Image")
                }
                ForEach(0..<images.count, id: \.self) { num in
                    images[num]
                        .resizable()
                        .scaledToFit()
                }

                //Button triggers ImagePicker
            }.sheet(isPresented: $showingImagePicker) {
                //ImagePickerView(image: $inputImage)
                MultipleImagePicker(images: $inputImages, selectionLimit: 3)
            }//if inputImage chagnes, loadImage to show it
            .onChange(of: inputImages) { newValue in
                //loadImage()
                images = []
                if(inputImages.count > 0){
//                    ForEach(0..<inputImages.count){num in
//                        let inputImage = inputImages[num]
//                        //images = Image(uiImage: inputImage)
//                        images.append(Image(uiImage: inputImage))
//       
//                    }
                    inputImages.forEach{ image in
                        let inputImage = image
                        //images = Image(uiImage: inputImage)
                        images.append(Image(uiImage: inputImage))
                        
                    }
                }
                print("here \(images.count)")
            }
       
        }
    }
    
}
