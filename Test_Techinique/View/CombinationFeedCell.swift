//
//  CombinationCell.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 16/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit

class CombinationFeedCell: FeedCell {
    
    var combinations = [Combination]()
    
    override func setupViews() {
        
        super.setupViews()
        fetchFoods()
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : collectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : collectionView]))
        
        self.collectionView.register(CombinationCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func fetchFoods() {
        FoodManager.shared.combinationFetch(){ starters,dishes,desert in
            self.combinations = []
            for i in starters{
                for j in dishes{
                    for k in desert{
                        let calories = i.calories!+j.calories!+k.calories!
                        if calories <= 550 && calories >= 450 {
                            self.combinations.append(Combination(starter: i.name, dish: j.name, desert: k.name, calories: (calories))!)
                        }
                    }
                }
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return combinations.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CombinationCell
        cell.combination = self.combinations[indexPath.item]
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 170)
    }
    
    
    
    
}
