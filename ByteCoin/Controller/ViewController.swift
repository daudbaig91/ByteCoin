//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,CoinManagerDelegate {
    func updatelabels(textin: Double) {
        
        DispatchQueue.main.async {
            
            self.pricedisp.text = String(Double(round(1000 * textin) / 1000))
        }
        print(String(textin))
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    var coinManager = CoinManager()

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var currecncydisp: UILabel!
    @IBOutlet weak var pricedisp: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.dataSource = self
        coinManager.delegate = self
        picker.delegate = self
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currecncydisp.text = coinManager.currencyArray[row]
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(coinManager.currencyArray[row])
        
        coinManager.getCoingPrice(currency: coinManager.currencyArray[row])
        
    }
    
    

}

