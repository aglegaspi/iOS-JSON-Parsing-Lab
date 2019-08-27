//
//  Colors.swift
//  JSON-Parsing-Lab
//
//  Created by Alexander George Legaspi on 8/27/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import Foundation
import UIKit

enum JSONError: Error {
    case decodingError(Error)
}

struct Response: Codable {
    let colors: Color?
    
    static func getResponse(from data: Data) throws -> [Response] {
        
        do {
            let colors = try JSONDecoder().decode([Response].self, from: data)
            return colors
        } catch {
            throw JSONError.decodingError(error)
        }
    }

}

struct Color: Codable {
    let hex: Hex
    let rgb: RGB
    let name: Name
}

struct Hex: Codable {
    let value: String
    let clean: String
}

struct RGB: Codable {
    let fraction: Fraction
}

struct Fraction: Codable {
    let r: CGFloat
    let g: CGFloat
    let b: CGFloat
}

struct Name: Codable {
    let value: String
}




