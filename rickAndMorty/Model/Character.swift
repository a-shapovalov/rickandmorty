//
//  Character.swift
//  rickAndMorty
//
//  Created by Антон Шаповалов on 23.03.2022.
//

import Foundation


struct Character {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let urlToImage: String
    
    init (dictionary: Dictionary<String, Any>){
        name = dictionary["name"] as? String ?? ""
        status = dictionary["status"] as? String ?? ""
        species = dictionary["species"] as? String ?? ""
        type = dictionary["type"] as? String ?? ""
        gender = dictionary["gender"] as? String ?? ""
        urlToImage = dictionary["image"] as? String ?? ""
    }
}


