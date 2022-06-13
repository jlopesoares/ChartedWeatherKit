//
//  WeatherViewController.swift
//  ChartedWeatherKit
//
//  Created by João Pedro on 13/06/2022.
//

import UIKit

class WeatherViewController: UIViewController {
  
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    
    @IBOutlet weak var maximumTemperatureLabel: UILabel!
    
    
    var viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        Task {
            guard let currentWeather = await viewModel.getWeather()?.currentWeather else {
                print("Something as failed")
                return
            }
            
            locationLabel.text = "Lisbon"
            currentWeatherLabel.text = "\(currentWeather.temperature.value)"
        }
    }
}
