//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate{
    func updatelabels(textin : Double)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    var delegate:CoinManagerDelegate?
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var price: Int = 0;
    let url = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let key = "?apikey=97F11C83-DD8A-4B57-84B0-ABEBE18F6D7E"
    
    func getCoingPrice(currency: String) {
           apirequest(url + currency + key)
    }
//        sdsd

    func apirequest(_ urlS: String) {
        if let url = URL(string: urlS){
            let Session = URLSession(configuration: .default)
            let task = Session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("error")
                    return
                }
                if let datas = data {
                     if let datapass = self.parseJason(datas){
                         self.delegate?.updatelabels(textin: datapass)
                    
                    }
                        
                
                    
                    
                }
            }
            task.resume()
        }
     
    }
    
    func parseJason(_ data: Data) -> Double?{
        let decode = JSONDecoder()
        do{
            let decodeData = try decode.decode(CoinData.self, from: data)
            let price = decodeData.rate
            return Double(price)
        }catch{
            
            return nil
        }
        
        
    }
}
