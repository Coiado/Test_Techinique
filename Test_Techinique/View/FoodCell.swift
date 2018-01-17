//
//  FoodCell.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 13/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class FoodCell: BaseCell {
    
    var imageManager: ImageManager { return .shared }
    
    var loadingIndicator: UIActivityIndicatorView!
    var request: Request?
    
    var food : Food? {
        didSet {
            reset()
            loadImage()
            nameLabel.text = food?.name
            
            if let calories = food?.calories {
                caloriesLabel.text = "Calories: \(String(describing: calories))"
            }
            
            //measure title text
            if let title = food?.name {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLabelHeightConstraint?.constant = 44
                } else {
                    titleLabelHeightConstraint?.constant = 20
                }
            }
        }
    }
    
    
    let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints=false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Endives en salade"
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
        
        addSubview(loadingIndicator)
        addSubview(foodImageView)
        addSubview(separatorView)
        addSubview(nameLabel)
        addSubview(caloriesLabel)
        
        //Constraints Image
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":foodImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-[v2]-16-[v3]-16-[v1(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":foodImageView, "v1":separatorView, "v2":nameLabel,"v3":caloriesLabel]))
        
        //Constraints Separator
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":separatorView]))
        
        //Constraints label name
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: foodImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: foodImageView, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .right, relatedBy: .equal, toItem: foodImageView, attribute: .right, multiplier: 1, constant: 0))
        
        //height constraint
        titleLabelHeightConstraint = NSLayoutConstraint(item: nameLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(titleLabelHeightConstraint!)
        
        //Constraints label calories
        addConstraint(NSLayoutConstraint(item: caloriesLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: caloriesLabel, attribute: .left, relatedBy: .equal, toItem: foodImageView, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: caloriesLabel, attribute: .right, relatedBy: .equal, toItem: foodImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: caloriesLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //Constraints indicator
        addConstraint(NSLayoutConstraint(item: loadingIndicator, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: loadingIndicator, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        
    }
    

    
    func reset() {
        foodImageView.image = nil
        request?.cancel()
    }
    
    func loadImage() {
        loadingIndicator.startAnimating()
        request = imageManager.retrieveImage(for: food!){ image in
                self.populate(with: image)
        }
    }
    
    func populate(with image: UIImage) {
        loadingIndicator.stopAnimating()
        foodImageView.image = image
    }
    
}
