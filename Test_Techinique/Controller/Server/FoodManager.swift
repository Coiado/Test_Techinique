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

class FoodManager {
    
    static let shared = FoodManager()
    
    
    func fetchFoods(completion: @escaping ([Food]) -> Void)  {
        Alamofire.request(
            URL(string: "http://54.72.164.109/itw/food/list/")!,
            method: .get,
            parameters: ["foo":"bar"],
            headers: ["Authorization": "Bearer iwn-31@!3pf(w]pmarewj236^in"])
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching tags: \(String(describing: response.result.error))")
                    completion([Food]())
                    return 
                }
                
                guard let responseJSON = response.result.value as? [[String: Any]] else {
                    print("Invalid tag information received from the service")
                    completion([Food]())
                    return
                }
                
                print(responseJSON)
                
                var foods = [Food]()
                
                for dictionary in responseJSON as [[String: AnyObject]] {
                    
                    let food = Food(name: dictionary["display_name"] as? String, img:dictionary["imgUrl"] as? String ,
                                    calories: dictionary["cal"] as? CGFloat, type:dictionary["type"] as? String)
                    
                    foods.append(food!)
                }
                completion(foods)
        }
    }
    
    func combinationFetch(completion: @escaping ([Food],[Food],[Food]) -> Void)  {
        Alamofire.request(
            URL(string: "http://54.72.164.109/itw/food/list/")!,
            method: .get,
            parameters: ["foo":"bar"],
            headers: ["Authorization": "Bearer iwn-31@!3pf(w]pmarewj236^in"])
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching tags: \(String(describing: response.result.error))")
                    completion([Food](),[Food](),[Food]())
                    return
                }
                
                guard let responseJSON = response.result.value as? [[String: Any]] else {
                    print("Invalid tag information received from the service")
                    completion([Food](),[Food](),[Food]())
                    return
                }
                
                
                var starters = [Food]()
                var dishes = [Food]()
                var deserts = [Food]()
                
                for dictionary in responseJSON as [[String: AnyObject]] {
                    
                    let food = Food(name: dictionary["display_name"] as? String, img:dictionary["imgUrl"] as? String ,
                                    calories: dictionary["cal"] as? CGFloat, type:dictionary["type"] as? String)
                    if food?.type == "starter" {
                        starters.append(food!)
                    }else if food?.type == "dish" {
                        dishes.append(food!)
                    }else if food?.type == "desert" {
                        deserts.append(food!)
                    }
                    
                }
                completion(starters,dishes,deserts)
        }
    }
    
    
}
