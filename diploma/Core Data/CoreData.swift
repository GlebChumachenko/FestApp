//
//  CoreData.swift
//  diploma
//
//  Created by Gleb Chumachenko on 24.10.22.
//

import Foundation
import CoreData

@objc(Favourite)
public class Favoutite: NSManagedObject, Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favoutite> {
        return NSFetchRequest<Favoutite>(entityName: "Favoutite")
    }
    
    @NSManaged public var isElected: String?
    
    
}
