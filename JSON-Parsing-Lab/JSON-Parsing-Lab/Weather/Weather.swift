//
//  Weather.swift
//  JSON-Parsing-Lab
//
//  Created by Alexander George Legaspi on 8/27/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import Foundation

enum WeatherJSONError: Error {
    case decodingError(Error)
}

struct WeatherResponse: Codable {
    let list: [List]
}

struct List: Codable {
    let weather: Weather
    let main: Main
    let name: String
    
    static func getList(from data: Data) throws -> [List] {
        do {
            let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse.list
        } catch {
            throw WeatherJSONError.decodingError(error)
        }
    }
}

struct Weather: Codable {
    let description: String
}

struct Main: Codable {
    let temp: Double
}


