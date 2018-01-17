//
//  Food.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 14/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit

class Food: NSObject{
    
    var name : String?
    var imgUrl: String?
    var calories : CGFloat?
    var type: String?
    
    required init?(name: String?, img: String?, calories: CGFloat?, type: String?) {
        self.name = name
        self.imgUrl = img
        self.calories = calories
        self.type = type
    }
    

    func description() -> String {
        return "Name: \(String(describing: self.name))" +
            "Calories: \(String(describing: self.calories))" +
        "Image URL: \(String(describing: self.imgUrl))\n"
    }
    
}
