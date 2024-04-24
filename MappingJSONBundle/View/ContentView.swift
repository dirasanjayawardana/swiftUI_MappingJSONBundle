//
//  ContentView.swift
//  MappingJSONBundle
//
//  Created by MACBOOK PRO on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    
    let colorData = ColorDataModel.loadColorData()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(colorData) { item in
                    ColorRowComponent(data: item)
                }
            }
            .navigationTitle("Color")
        }
    }
}

#Preview {
    ContentView()
}

struct ColorRowComponent: View {
    var data: ColorDataModel
    
    var body: some View {
        HStack(spacing: 16) {
            data.uiImage
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
                .background(data.uiColor)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(data.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
        }
    }
}
