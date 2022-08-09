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
  let cellIdentifier = "todoCell"

  // MARK: - Init

  init() {
    getTodos()
  }

  // MARK: - Methods

  func getTodos() {
    do {
      todos = try context.fetch(Todo.fetchRequest())
    } catch let e {
      // error
      print(e)
    }
  }

  func createTodo(with name: String) {
    let newTodo = Todo(context: context)
    newTodo.name = name
    newTodo.createdAt = Date()

    do {
      try context.save()
    } catch let e {
      print(e)
    }
  }

  func deleteTodo(todo: Todo) {
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
