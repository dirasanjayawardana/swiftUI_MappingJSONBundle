//
//  ColorDataModel.swift
//  MappingJSONBundle
//
//  Created by MACBOOK PRO on 24/04/24.
//

import Foundation
import SwiftUI

struct ColorDataModel: Codable, Identifiable {
    let id: Int
    let name: String
    let color: String
    let image: String
    
    // handle color hex to rgb
    var uiColor: Color {
        colorFromHexString(color)
    }
    
    // handle jika image bukan SFSymbol
    var uiImage: Image {
        Image(systemName: image)
    }
}


// Bundle data json, decode json ke model
extension ColorDataModel {
    static func loadColorData() -> [ColorDataModel] {
        guard 
            let url = Bundle.main.url(forResource: "Colors", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else { fatalError("Failed to load data JSON Data form bundle") }
        
        do {
            let decodedColor = try JSONDecoder().decode([ColorDataModel].self, from: data)
            return decodedColor
        } catch {
            fatalError("Failed to decode JSON Data from bundle: \(error.localizedDescription)")
        }
    }
}
