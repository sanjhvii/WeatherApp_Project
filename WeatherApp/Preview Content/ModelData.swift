//
//  ModelData.swift
//  WeatherApp
//
//  Created by Sanjhvi Dogra on 2024-02-20.
//

import Foundation

// If you wish to Archive this project, move this file outside of the Preview Content folder, as this folder is not taken into consideration by the Xcode Archive

// Load preview weather data from a JSON file
var previewWeather: ResponseBody = load("weatherData.json")

// Function to load data from a JSON file
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // Check if the file exists in the main bundle
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        // Read the contents of the file into data
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        // Decode the data into the specified type T
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
