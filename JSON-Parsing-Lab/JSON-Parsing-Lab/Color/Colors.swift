


import Foundation
import UIKit

enum JSONError: Error {
    case decodingError(Error)
}

struct Response: Codable {
    let colors: [Color]
    
}

struct Color: Codable {
    let hex: Hex
    let rgb: RGB
    let name: Name
    
    static func getColors(from data: Data) throws -> [Color] {
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response.colors
        } catch {
            throw JSONError.decodingError(error)
        }
    }

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
    
    func backgroundColor() -> UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

struct Name: Codable {
    let value: String
}




