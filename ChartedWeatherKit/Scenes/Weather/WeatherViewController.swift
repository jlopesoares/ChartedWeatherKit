//
//  WeatherViewController.swift
//  ChartedWeatherKit
//
//  Created by João Pedro on 13/06/2022.
//

import UIKit
import SwiftUI

class WeatherViewController: UIViewController {
  
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    
    @IBOutlet weak var weatherChartContainerView: UIView!
    
    var viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        Task {
            guard let _ = await viewModel.getWeather() else {
                print("Something as failed")
                return
            }
            
            locationLabel.text = viewModel.currentLocation
            currentWeatherLabel.text = viewModel.currentTemperature
            minimumTemperatureLabel.text = viewModel.dailyMinTemperature
            maximumTemperatureLabel.text = viewModel.dailyMaxTemperature
            
            setupChart()
        }
    }
    
    func setupChart() {
        
        let hosting = UIHostingController(rootView: WeatherChart(forecast: viewModel.hourlyWeather))
        weatherChartContainerView.addSubview(hosting.view)
        hosting.view.frame = weatherChartContainerView.bounds
    }
}
