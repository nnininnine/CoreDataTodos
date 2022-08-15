//
//  User+CoreDataProperties.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 15/8/2565 BE.
//
//

import CoreData
import Foundation

public extension User {
  @nonobjc class func fetchRequest() -> NSFetchRequest<User> {
    return NSFetchRequest<User>(entityName: "User")
  }

  @NSManaged var id: UUID?
  @NSManaged var username: String?
}

extension User: Identifiable {}
