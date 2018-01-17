//
//  FoodManager.swift
//  Test_Techinique
//
//  Created by Lucas Coiado Mota on 16/01/18.
//  Copyright © 2018 Lucas Coiado Mota. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ImageManager {
    
    static let shared = ImageManager()
    
    
    func retrieveImage(for food: Food, completion: @escaping (UIImage) -> Void) -> Request {
        return Alamofire.request((food.imgUrl)!).responseImage { response in
            guard let image = response.result.value else {
                print("Invalid tag information received from the service")
                return
            }
            completion(image)
        }
    }
    
}
