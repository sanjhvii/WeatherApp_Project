//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Sanjhvi Dogra on 2024-02-20.
//

import SwiftUI
import CoreLocationUI // Import CoreLocationUI framework for LocationButton

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager // Access the LocationManager object
    
    var body: some View {
        VStack { // Vertical stack for main content
            VStack(spacing: 20) {
                Text("Welcome to the Weather App") // Display welcome message
                    .bold()
                    .font(.title)
                
                Text("Please share your current location to get the weather in your area") // Display instruction
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()

            
            // LocationButton from CoreLocationUI framework imported above, allows us to request location
            LocationButton(.shareCurrentLocation) { // Button to share current location
                locationManager.requestLocation() // Call the requestLocation method from LocationManager
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Frame to fill the entire screen
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView() // Preview the WelcomeView
    }
}
