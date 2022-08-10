//
//  User+CoreDataProperties.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 10/8/2565 BE.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var id: UUID?

}

extension User : Identifiable {

}
