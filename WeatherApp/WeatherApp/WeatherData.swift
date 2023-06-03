//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Mac on 03/06/23.
//

import Foundation
struct WeatherData:Codable{
    let location:LocationData
    let current:CurrentData
}
