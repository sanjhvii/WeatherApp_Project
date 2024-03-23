// WeatherRow.swift
// WeatherApp
// Created by Sanjhvi Dogra on 2024-02-20.

import SwiftUI

struct WeatherRow: View {
    var logo: String // Logo image name
    var name: String // Weather attribute name
    var value: String // Weather attribute value
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo) // Display logo icon
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888)) // Background color
                .cornerRadius(50) // Rounded corners for logo

            VStack(alignment: .leading, spacing: 8) {
                Text(name) // Display weather attribute name
                    .font(.caption)

                Text(value) // Display weather attribute value
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°") // Preview with sample data
    }
}


