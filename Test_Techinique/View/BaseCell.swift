//
//  BaseCell.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 14/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
