//
//  CoreDataManager.swift
//  diploma
//
//  Created by Gleb Chumachenko on 24.10.22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    var modelName = ""
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: {
            storageDesc, error in
        })
        
        return container
    }()
    
    init(modelName: String){
        self.modelName = modelName
    }
    
    func save(completion: (Error?) -> ()){
        
        guard context.hasChanges else{
            completion(CoreDataManagerError.noData)
            return
        }
        
        do {
            try context.save()
            completion(nil)
        }
        catch {
            completion(error)
        }
    }
}

enum CoreDataManagerError: Error {
    case noData
    
}
