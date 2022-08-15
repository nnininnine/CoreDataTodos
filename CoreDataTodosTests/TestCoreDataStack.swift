//
//  TestCoreDataStack.swift
//  CoreDataTodosTests
//
//  Created by 7Peaks on 15/8/2565 BE.
//

import CoreData
import Foundation

class TestCoreDataStack {
  // MARK: - Properties

  static let shared: TestCoreDataStack = .init()

  lazy var persistentContainer: NSPersistentContainer = {
    let description: NSPersistentStoreDescription = .init(url: URL(fileURLWithPath: "/dev/null")) // persist the data in-memory

    let container: NSPersistentContainer = .init(name: "CoreDataTodos")
    container.persistentStoreDescriptions = [description]
    container.loadPersistentStores(completionHandler: { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })

    return container
  }()

  // MARK: - Init

  private init() {}
}
