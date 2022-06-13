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
    
    var weather: Weather?
    
    var currentLocation: String {
        return "Lisbon"
    }
    
    var currentTemperature: String? {
        return weather?.currentWeather.temperature.formatted()
    }
    
    var dailyMinTemperature: String? {
        
        guard
            let lowTemp = weather?.dailyForecast.min(by: { $0.lowTemperature < $1.lowTemperature })?.lowTemperature.formatted()
        else {
            return nil
        }
        
        return "Min.:" + lowTemp
    }
    
    var dailyMaxTemperature: String? {
      
        guard
            let highTemp = weather?.dailyForecast.max(by: { $0.highTemperature < $1.highTemperature })?.highTemperature.formatted()
        else {
            return nil
        }
        
        return "Max.:" + highTemp
    }
    
    var hourlyWeather: [HourlyWeather] {
        
        guard let weather else {
            return []
        }
        
        return weather.dailyForecast.forecast
            .map({ HourlyWeather(hour: $0.date.formatted(date: .abbreviated, time: .shortened),
                                 temperature: Int($0.highTemperature.value)) })
    }
    
}

//MARK: - Service
extension WeatherViewModel {
    
    func getWeather() async -> Weather? {
        
        let weatherService = WeatherService()
        weather = try? await weatherService.weather(for: CLLocation(latitude: 38.736946, longitude: -9.142685))
        
        return weather
    }
}
