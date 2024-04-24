//
//  ColorFromHex.swift
//  MappingJSONBundle
//
//  Created by MACBOOK PRO on 24/04/24.
//

import Foundation
import SwiftUI

func colorFromHexString(_ hex: String) -> Color {
    
    // hapus karakter white space dan buat uppercase
    let hex = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    // validasi hex (6 digit tanpa #, 7 digit dengan #)
    guard hex.count == 6 || (hex.count == 7 && hex.hasPrefix("#")) else {
        return Color(red: 0, green: 0, blue: 0) // return default color black
    }
    
    // hapus # jika ada
    let hexColor = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
    
    // ambil nilai red green blue dari hex(RRGGBB)
    let redColor = hexColor.prefix(2)
    let greenColor = hexColor.dropFirst(2).prefix(2)
    let blueColor = hexColor.suffix(2)
    
    // konversi ke integer
    // var redInt: UInt64 = 0
    // var greenInt: UInt64 = 0
    // var blueInt: UInt64 = 0
    // Scanner(string: String(redColor)).scanHexInt64(&redInt)
    // Scanner(string: String(greenColor)).scanHexInt64(&greenInt)
    // Scanner(string: String(blueColor)).scanHexInt64(&blueInt)
    guard let r = UInt64(redColor, radix: 16), let g = UInt64(greenColor, radix: 16), let b = UInt64(blueColor, radix: 16) else {
        return Color(red: 0, green: 0, blue: 0) // return default color black
    }
    
    // konversi ke CGFloat dan bagi dengan 255 untuk mendapatkan nilai dari 0 hingga 1
    // let redCGFloat = CGFloat(redInt) / 255.0
    // let greenCGFloat = CGFloat(greenInt) / 255.0
    // let blueCGFloat = CGFloat(blueInt) / 255.0
    // let results = Color(red: redCGFloat, green: greenCGFloat, blue: blueCGFloat)
    
    let results = Color(red: Double(r), green: Double(g), blue: Double(b) / 255)
    
    return results
}
