//
//  TodosViewModel.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 11/8/2565 BE.
//

import CoreData
import UIKit

class TodosViewModel {
  // MARK: - Properties
  
  private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  var folder: Folder
  var todos: [Todo] = []
  let cellIdentifier = "todoCell"
  
  // MARK: - Init
  
  init(with folder: Folder) {
    self.folder = folder
    
    getTodos(by: self.folder)
  }
  
  // MARK: - Methods
  
  func getTodos(by folder: Folder) {
    let oid = folder.objectID
    
    do {
      self.folder = try context.existingObject(with: oid) as! Folder
      todos = self.folder.todos?.allObjects as! [Todo]
    } catch let e {
      // error
      print(e)
    }
  }
  
  func createTodo(with name: String) {
    // create todo
    let todo = Todo(context: context)
    todo.name = name
    todo.createdAt = Date()
    
    // add todo to folder
    folder.addToTodos(todo)
    
    // save
    do {
      try context.save()
    } catch let e {
      print(e)
    }
  }
  
  func deleteTodo(todo: Todo) {
    // remove from folder
    folder.removeFromTodos(todo)
    
    context.delete(todo)

    do {
      try context.save()
    } catch let e {
      print(e)
    }
  }

  func updateTodo(todo: Todo, with name: String) {
    todo.name = name

    do {
      try context.save()
    } catch let e {
      print(e)
    }
  }
}
