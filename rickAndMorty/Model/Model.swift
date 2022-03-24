//
//  Model.swift
//  rickAndMorty
//
//  Created by Антон Шаповалов on 24.03.2022.
//

import Foundation

var results: [Character] = []

var urlToData:URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadCharacters(completionHandler: (()->Void)?){
    
    let url = URL(string: "https://rickandmortyapi.com/api/character")!
    
    let downLoadTask = URLSession(configuration: .default).downloadTask(with: url) { (urlFile, response, error) in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            
            parseResults()
            completionHandler?()
        }
    }
    downLoadTask.resume()
}

func parseResults() {
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        print("1")
        return
        
    }
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        print("2")
        return
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary <String, Any>
    if rootDictionary == nil {
        print("3")
        return
    }
    
    if let array = rootDictionary!["results"] as? [Dictionary<String,Any>] {
        
        var returnArray: [Character] = []
        for dict in array {
            let newCharacter = Character(dictionary: dict)
            returnArray.append(newCharacter)
        }
        results = returnArray
    }
}
