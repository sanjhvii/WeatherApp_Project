// WeatherManager.swift
// WeatherApp
//
// Created by Sanjhvi Dogra on 2024-02-20.

import Foundation
import CoreLocation

class WeatherManager {
    // HTTP request to get the current weather depending on the coordinates we got from LocationManager
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        // Replace YOUR_API_KEY with your own API key
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=a7e0630473583367654a82d6f1c32a66&units=metric") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse // Coordinates of the location
    var weather: [WeatherResponse] // Weather details
    var main: MainResponse // Main weather information
    var name: String // Name of the location
    var wind: WindResponse // Wind details

    struct CoordinatesResponse: Decodable {
        var lon: Double // Longitude coordinate
        var lat: Double // Latitude coordinate
    }

    struct WeatherResponse: Decodable {
        var id: Double // Weather condition ID
        var main: String // Main weather description
        var description: String // Weather description
        var icon: String // Weather icon code
    }

    struct MainResponse: Decodable {
        var temp: Double // Temperature in Celsius
        var feels_like: Double // "Feels like" temperature
        var temp_min: Double // Minimum temperature
        var temp_max: Double // Maximum temperature
        var pressure: Double // Atmospheric pressure
        var humidity: Double // Humidity level
    }
    
    struct WindResponse: Decodable {
        var speed: Double // Wind speed
        var deg: Double // Wind direction in degrees
    }
}

// Extension to provide computed properties for ResponseBody.MainResponse
extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like } // Computed property for "feels_like" temperature
    var tempMin: Double { return temp_min } // Computed property for minimum temperature
    var tempMax: Double { return temp_max } // Computed property for maximum temperature
}
