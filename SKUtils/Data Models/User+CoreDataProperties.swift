//
//  User+CoreDataProperties.swift
//  
//
//  Created by Sergey Kostyan on 26.08.2018.
//
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

}
