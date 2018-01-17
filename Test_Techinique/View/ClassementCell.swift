//
//  ClassementCell.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 16/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit

class ClassementCell: CombinationCell {
    
    
    
    var gradeLabel: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
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
        addSubview(gradeLabel)
        
        //Constraints Starter
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":starterLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0(20)]-16-[v2(20)]-16-[v3(20)]-16-[v4(20)]-16-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":starterLabel, "v1":separatorView, "v2":dishLabel,"v3":desertLabel,"v4":caloriesLabel]))
        
        //Constraints Separator
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))
        
        //Constraints Dish Label
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dishLabel]))
        
        //Constraints Desert Label
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0]-30-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":desertLabel]))
        
        //Constraints Calories Label
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[v0]-[v1]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":caloriesLabel,"v1":gradeLabel]))
        
        //Constraints Grade Label
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-20-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":gradeLabel,"v1":separatorView,"v2":desertLabel]))

        
        
        
        
        
        
    }
}
