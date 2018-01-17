//
//  ClassementFeedCell.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 16/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit

class ClassementFeedCell: CombinationFeedCell {
    
    override func setupViews() {
        
        super.setupViews()
        fetchFoods()
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : collectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : collectionView]))
        
        self.collectionView.register(ClassementCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func fetchFoods() {
        FoodManager.shared.combinationFetch(){ starters,dishes,desert in
            self.combinations = []
            for i in starters{
                for j in dishes{
                    for k in desert{
                        let calories = i.calories!+j.calories!+k.calories!
                        self.combinations.append(Combination(starter: i.name, dish: j.name, desert: k.name, calories: (calories))!)
                    }
                }
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ClassementCell
        let calories = Int(self.combinations[indexPath.item].calories!)
        if calories <= 550 && calories >= 450{
            cell.gradeLabel.text = "A"
        }else if calories <= 600 && calories >= 400{
            cell.gradeLabel.text = "B"
        }else if calories <= 650 && calories >= 350{
            cell.gradeLabel.text = "C"
        }else if calories <= 700 && calories >= 300{
            cell.gradeLabel.text = "D"
        }else {
            cell.gradeLabel.text = ""
        }
            
        cell.combination = self.combinations[indexPath.item]
        
        return cell
    }
    
    
}
