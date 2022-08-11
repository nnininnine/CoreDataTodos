//
//  Folder+CoreDataProperties.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 11/8/2565 BE.
//
//

import CoreData
import Foundation

public extension Folder {
  @nonobjc class func fetchRequest() -> NSFetchRequest<Folder> {
    return NSFetchRequest<Folder>(entityName: "Folder")
  }

  @NSManaged var name: String?
  @NSManaged var createdAt: Date?
  @NSManaged var todos: NSSet?
}

// MARK: Generated accessors for todos

public extension Folder {
  @objc(addTodosObject:)
  @NSManaged func addToTodos(_ value: Todo)

  @objc(removeTodosObject:)
  @NSManaged func removeFromTodos(_ value: Todo)

  @objc(addTodos:)
  @NSManaged func addToTodos(_ values: NSSet)

  @objc(removeTodos:)
  @NSManaged func removeFromTodos(_ values: NSSet)
}

extension Folder: Identifiable {}
