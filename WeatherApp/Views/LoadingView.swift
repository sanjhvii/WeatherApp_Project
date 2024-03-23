//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Sanjhvi Dogra on 2024-02-20.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView() // Display a progress view indicating loading state
            .progressViewStyle(CircularProgressViewStyle(tint: .white)) // Set progress view style with white tint
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Set frame to fill maximum available space
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView() // Preview loading view
    }
}
