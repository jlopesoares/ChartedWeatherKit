//
//  WeatherViewModel.swift
//  ChartedWeatherKit
//
//  Created by João Pedro on 13/06/2022.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherViewModel {
    
    func getWeather() async -> Weather? {
        
        let weatherService = WeatherService()
        return try? await weatherService.weather(for: CLLocation(latitude: 38.736946, longitude: -9.142685))
    }
}
