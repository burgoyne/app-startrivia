//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Andre Burgoyne on 2018-09-14.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import Foundation
import Alamofire

class PersonApi {
    
    func getRandomPersonAlamo(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let json = response.result.value as? [String: Any] else { return completion(nil) }
            let person = self.parsePersonManual(json: json)
            completion(person)
        }
    }
    
    private func parsePersonManual(json: [String: Any]) -> Person {
        let name = json["name"] as? String ?? "" //pull name as string, default to an empty string
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starshipUrls = json["starships"] as? [String] ?? [String]()
        
        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrls: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
        
        return person
    }
}
