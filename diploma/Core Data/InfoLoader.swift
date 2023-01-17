//
//  InfoLoader.swift
//  diploma
//
//  Created by Gleb Chumachenko on 24.10.22.
//

import Foundation

struct Festival: Codable{
    var title: String?
    var body: String?
    var date: String?
   
}

class DataLoader {
    var users = [Festival]()

    let fileLocation = Bundle.main.url(forResource: "string-to-json-online", withExtension: "json")
    
    func load(){
        if  let fileLocation1 = fileLocation{
            do {
                let data = try Data(contentsOf: fileLocation1)
                let decoder = JSONDecoder()
                let dataFromJson = try decoder.decode([Festival].self, from: data)
                users.self = dataFromJson
            }
            catch {
                print(error)
            }
        }
    }
}
