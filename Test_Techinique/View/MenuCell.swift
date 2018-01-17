//
//  MenuCell.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 14/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
   
    override var isHighlighted: Bool {
        didSet {
            iconImage.tintColor = isHighlighted ? UIColor.white : UIColor.gray
        }
    }
    
    override var isSelected: Bool {
        didSet {
            iconImage.tintColor = isSelected ? UIColor.white : UIColor.gray
        }
    }
    
    override func setupViews(){
        super.setupViews()
        addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(32)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : iconImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(32)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : iconImage]))
        addConstraint(NSLayoutConstraint(item: iconImage, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconImage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
    }
    
    
    
    
}
