//
//  Todo+CoreDataProperties.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 10/8/2565 BE.
//
//

import CoreData
import Foundation

public extension Todo {
  @nonobjc class func fetchRequest() -> NSFetchRequest<Todo> {
    return NSFetchRequest<Todo>(entityName: "Todo")
  }

  @NSManaged var name: String?
  @NSManaged var createdAt: Date?
  @NSManaged var folder: Folder?
}

extension Todo: Identifiable {}
