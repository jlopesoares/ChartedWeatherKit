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
    
    }
}

struct WeatherChart_Previews: PreviewProvider {
    static var previews: some View {
        
        WeatherChart(forecast: [
            .init(hour: "0", temperature: 10),
            .init(hour: "1", temperature: 13),
            .init(hour: "2", temperature: 15),
            .init(hour: "3", temperature: 13)
        ])
    }
}
