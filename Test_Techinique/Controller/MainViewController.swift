//
//  ViewController.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 13/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit
import Alamofire


class MainViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout,UISearchBarDelegate {

    
    
    var cellId = "cellId"
    var combinationId = "combinationId"
    var classementId = "classementId"
    let titles = ["Aliments","Combinaison","Classement"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Aliments"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        navigationItem.titleView = titleLabel
        
        setupCollectionView()
        setupMenuBar()
        
    }
    
    
    func scrollMenuIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: UICollectionViewScrollPosition(), animated: true )
        let titleLabel = UILabel()
        titleLabel.text = titles[indexPath.item]
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        navigationItem.titleView = titleLabel
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.mainController = self
        return mb
    }()
    
    private func setupMenuBar(){
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : menuBar]))
        view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .height, relatedBy: .equal, toItem: menuBar, attribute: .height, multiplier: 0, constant: 50))
    }
    
    func setupCollectionView(){
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(CombinationFeedCell.self, forCellWithReuseIdentifier: combinationId)
        collectionView?.register(ClassementFeedCell.self, forCellWithReuseIdentifier: classementId)
        
        collectionView?.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 50,right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0,0,50,0)
        if let flowLayout = collectionView?.collectionViewLayout as?
            UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.isPagingEnabled = true
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 1{
            return collectionView.dequeueReusableCell(withReuseIdentifier: combinationId, for: indexPath)
        }else if indexPath.item == 2{
            return collectionView.dequeueReusableCell(withReuseIdentifier: classementId, for: indexPath)
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: view.frame.width, height: view.frame.height-50)
    }
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.move().x/view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: UICollectionViewScrollPosition())
        
        let titleLabel = UILabel()
        titleLabel.text = titles[indexPath.item]
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        navigationItem.titleView = titleLabel
        
    }
    

    


}


