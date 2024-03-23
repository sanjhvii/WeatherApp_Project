//
//  ContentView.swift
//  WeatherApp
//
//  Created by Sanjhvi Dogra on 2024-02-20.
//
import SwiftUI

struct ContentView: View {

    @StateObject var locationManager = LocationManager() // State object to manage location updates
    var weatherManager = WeatherManager() // Weather manager instance to fetch weather data
    @State var weather: ResponseBody? // State variable to store weather data
    
    var body: some View {
        VStack {
            if let location = locationManager.location { // Check if location data is available
                if let weather = weather { // Check if weather data is available
                    WeatherView(weather: weather) // Display weather view
                } else {
                    LoadingView() // Display loading view while fetching weather data
                        .task {
                            do {
                                // Update the latitude and longitude values to Toronto's coordinates
                                weather = try await weatherManager.getCurrentWeather(latitude: 43.65107, longitude: -79.347015) // Fetch weather data asynchronously for Toronto
                            } catch {
                                print("Error getting weather: \(error)") // Handle error if weather data retrieval fails
                            }
                        }
                }
            } else {
                if locationManager.isLoading { // Check if location data is loading
                    LoadingView() // Display loading view
                } else {
                    WelcomeView() // Display welcome view if location data is not available
                        .environmentObject(locationManager) // Pass location manager as environment object
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354)) // Set background color
        .preferredColorScheme(.dark) // Set preferred color scheme to dark mode
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() // Preview content view
    }
}
