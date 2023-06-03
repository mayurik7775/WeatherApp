//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mac on 03/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var updatetimelbl: UILabel!
    @IBOutlet weak var regionlbl: UILabel!
    @IBOutlet weak var countrylbl: UILabel!
    @IBOutlet weak var templbl: UILabel!
    @IBOutlet weak var windlbl: UILabel!
    @IBOutlet weak var humiditylbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    func fetchData()
    {
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=65a7aea3e395474187a20653220504&q=india&aqi=no")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data , response , error) in
                guard let data = data , (response != nil), error == nil else{
                    print("Error Occured While Accessing Data with URL")
                    return
                }
                var fullWeatherData:WeatherData?
                do{
                    fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                }
                catch{
                    print("Error Occured While Decoding JSON into Swift Structuer \(error)")
                }
                DispatchQueue.main.async {
                    self.updatetimelbl.text = "Updated : \(fullWeatherData!.current.last_updated)"
                    self.regionlbl.text = "Region : \(fullWeatherData!.location.region)"
                    self.countrylbl.text = "Country : \(fullWeatherData!.location.country)"
                    self.templbl.text = "Temperature : \(fullWeatherData!.current.temp_c)"
                    self.humiditylbl.text = "Humidity : \(fullWeatherData!.current.humidity)"
                    self.windlbl.text = "Wind (Km/Hr) : \(fullWeatherData!.current.wind_kph)"
                
            }
        })
        dataTask.resume()
    }
    
    
    @IBAction func updatebtn(_ sender: Any) {
        fetchData()
    }
    
}

