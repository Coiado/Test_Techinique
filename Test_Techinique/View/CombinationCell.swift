//
//  CombinationCell.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 16/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit

class CombinationCell: BaseCell {
    
    
    var loadingIndicator: UIActivityIndicatorView!
    
    var combination : Combination? {
        didSet {
            
            if let starter = combination?.starter{
               starterLabel.text = "Entrée: \(starter)"
            }
            
            if let dish = combination?.dish {
                dishLabel.text = "Plat: \(dish)"
            }
            if let desert = combination?.desert {
                desertLabel.text = "Dessert: \(desert)"
            }
            if let calories = combination?.calories {
                caloriesLabel.text = "Calories: \(String(describing: calories))"
            }
        }
    }
    
    
    
    let starterLabel: UILabel = {
        let label = UILabel()
        label.text = "Endives en salade"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    let dishLabel: UILabel = {
        let label = UILabel()
        label.text = "Pâtes au pesto"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    let desertLabel: UILabel = {
        let label = UILabel()
        label.text = "Gateau à l'orange"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    let caloriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Calories: 17"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    override func setupViews(){
        backgroundColor = UIColor.white
        
        loadingIndicator = UIActivityIndicatorView()
        loadingIndicator.color = UIColor.black
        loadingIndicator.translatesAutoresizingMaskIntoConstraints=false
        
        addSubview(starterLabel)   
        addSubview(dishLabel)
        addSubview(desertLabel)
        addSubview(caloriesLabel)
        addSubview(separatorView)
        
        //Constraints Starter
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":starterLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0(20)]-16-[v2(20)]-16-[v3(20)]-16-[v4(20)]-16-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":starterLabel, "v1":separatorView, "v2":dishLabel,"v3":desertLabel,"v4":caloriesLabel]))
        
        //Constraints Separator
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))
        
        //Constraints Dish Label
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dishLabel]))
        
        //Constraints Desert Labell
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":desertLabel]))
        
        //Constraints Calories Label
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":caloriesLabel]))
        
        
        
        
    }
    
    

}
