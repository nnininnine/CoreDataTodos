//
//  HomeViewModel.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 8/8/2565 BE.
//

import CoreData
import UIKit

class HomeViewModel {
  // MARK: - Properties

  private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  var todos: [Todo] = []

  // MARK: - Init

  // MARK: - Methods

  func getTodos() {
    do {
      todos = try context.fetch(Todo.fetchRequest())
    } catch let e {
      // error
      print(e)
    }
  }

  func createTodo(with name: String) {}

  func deleteTodo(todo: Todo) {}

  func updateTodo(todo: Todo) {}
}
