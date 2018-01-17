//
//  File.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 16/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit

class Combination: NSObject{
    
    var starter : String?
    var dish: String?
    var desert: String?
    var calories : CGFloat?
    
    required init?(starter: String?, dish: String?,desert: String?, calories: CGFloat?) {
        self.starter = starter
        self.dish = dish
        self.desert = desert
        self.calories = calories
    }
    
    
    func description() -> String {
        return "Entrée,: \(String(describing: self.starter))" +
            "Plat: \(String(describing: self.dish))" +
        "Dessert: \(String(describing: self.desert))\n"
    }
    
}

