//
//  Todo+CoreDataProperties.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 8/8/2565 BE.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension Todo : Identifiable {

}
