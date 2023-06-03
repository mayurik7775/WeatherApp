//
//  CurrentData.swift
//  WeatherApp
//
//  Created by Mac on 03/06/23.
//

import Foundation
struct CurrentData:Codable{
    let last_updated:String
    let temp_c:Float
    let wind_kph:Float
    let humidity:Int
}
