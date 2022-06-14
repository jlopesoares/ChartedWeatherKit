//
//  WeatherChart.swift
//  ChartedWeatherKit
//
//  Created by João Pedro on 13/06/2022.
//

import SwiftUI
import Charts
import WeatherKit

struct WeatherChart: View {
    
    var forecast: [HourlyWeather]
    
    var body: some View {
        Chart (forecast, id: \.hour){ hourWeather in
            
            LineMark(x: .value("hour", hourWeather.hour),
                     y: .value("temperature", hourWeather.temperature))
            
            .interpolationMethod(.cardinal)
            .foregroundStyle(.linearGradient(.init(colors: [.blue, .green]), startPoint: .zero, endPoint: .trailing))
        }
        .chartYScale(domain: 10...40)
        .chartXAxis(.hidden)
    
    }
}

struct WeatherChart_Previews: PreviewProvider {
    static var previews: some View {
        
        WeatherChart(forecast: [
            .init(hour: "0", temperature: 10),
            .init(hour: "1", temperature: 13),
            .init(hour: "2", temperature: 15),
            .init(hour: "3", temperature: 13),
            .init(hour: "4", temperature: 13),
            .init(hour: "5", temperature: 13),
            .init(hour: "6", temperature: 13),
            .init(hour: "7", temperature: 13),
            .init(hour: "8", temperature: 13),
            .init(hour: "9", temperature: 13),
            .init(hour: "10", temperature: 13),
            .init(hour: "11", temperature: 13),
            .init(hour: "12", temperature: 13),
            .init(hour: "13", temperature: 13),
            .init(hour: "14", temperature: 13),
            .init(hour: "15", temperature: 13),
            .init(hour: "16", temperature: 13),
            .init(hour: "17", temperature: 13),
            .init(hour: "18", temperature: 13),
            .init(hour: "19", temperature: 13),
            .init(hour: "20", temperature: 13),
            .init(hour: "21", temperature: 13),
            .init(hour: "22", temperature: 13),
            .init(hour: "23", temperature: 13),
            .init(hour: "24", temperature: 13),
        ])
    }
}
