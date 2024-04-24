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
                    HStack(spacing: 16) {
                        item.uiImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                            .background(item.uiColor)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        Text(item.name)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                    }
                }
            }
            .navigationTitle("Color")
        }
    }
}

#Preview {
    ContentView()
}
