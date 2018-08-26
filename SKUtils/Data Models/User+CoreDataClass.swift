//
//  User+CoreDataClass.swift
//  
//
//  Created by Sergey Kostyan on 26.08.2018.
//
//

import Foundation
import CoreData
import ObjectMapper

@objc(User)
public class User: NSManagedObject, BaseMappable {
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
}
