//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Sanjhvi Dogra on 2024-02-20.
//

import SwiftUI

struct WeatherView: View {
   
    var weather: ResponseBody // Weather data received from the API
    
    var body: some View {
        ZStack(alignment: .leading) { // Stack views on top of each other with leading alignment
            VStack { // Vertical stack for main content
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name) // Display city name
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))") // Display current date and time
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer() // Spacer to push content to top
                
                VStack { // Vertical stack for weather details
                    HStack { // Horizontal stack for weather icon and main weather condition
                        VStack(spacing: 20) {
                            Image(systemName: "cloud") // Display weather icon
                                .font(.system(size: 40))
                            
                            Text("\(weather.weather[0].main)") // Display main weather condition
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer() // Spacer to push content to right
                        
                        Text(weather.main.feelsLike.roundDouble() + "°") // Display feels like temperature
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height:  80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView() // Placeholder while loading image
                    }
                    
                    Spacer() // Spacer to push content to bottom
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack { // Vertical stack for additional weather details
                Spacer() // Spacer to push content to bottom
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now") // Section title
                        .bold()
                        .padding(.bottom)
                    
                    HStack { // Horizontal stack for min and max temperatures
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack { // Horizontal stack for wind speed and humidity
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom) // Ignore safe area for bottom edge
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354)) // Background color
        .preferredColorScheme(.dark) // Dark color scheme
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather) // Preview weather view
    }
}
