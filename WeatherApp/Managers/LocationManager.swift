//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Sanjhvi Dogra on 2024-02-20.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // Creating an instance of CLLocationManager, the framework we use to get the coordinates
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? // The user's current location coordinates
    @Published var isLoading = false // Indicates whether location data is being loaded
    
    override init() {
        super.init()
        
        // Assigning a delegate to our CLLocationManager instance
        manager.delegate = self
    }
    
    // Requests the one-time delivery of the user’s current location
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // Set the location coordinates to the location variable
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    // This function will be called if we run into an error while getting the location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
