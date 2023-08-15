//
//  Parent.swift
//  PhotoPicker
//
//  Created by Kentaro Mihara on 2023/08/15.
//

import SwiftUI
import Foundation


struct Parent: View{
    
    var body: some View {
        NavigationView{
            TabView{
                SingleImagePickerScreen()
                    .tabItem {
                        Image(systemName: "photo")
                        Text("Single")
                    }
                
                MultipleImagePickerScreen()
                    .tabItem {
                        Image(systemName: "photo")
                        Text("Multiple")
                    }
            }
            .accentColor(.black)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}
