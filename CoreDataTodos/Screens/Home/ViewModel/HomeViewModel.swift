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

  private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  var folders: [Folder] = []
  let cellIdentifier = "folderCell"

  // MARK: - Init

  init() {
    getFolders()
  }

  init(with context: NSManagedObjectContext) {
    self.context = context

    getFolders()
  }

  // MARK: - Methods

  func getFolders() {
    do {
      folders = try context.fetch(Folder.fetchRequest())
    } catch let e {
      // error
      print(e)
    }
  }

  func createFolder(with name: String) {
    let newFolder = Folder(context: context)
    newFolder.name = name
    newFolder.createdAt = Date()

    do {
      try context.save()
    } catch let e {
      print(e)
    }
  }

  func deleteFolder(folder: Folder) {
    context.delete(folder)

    do {
      try context.save()
    } catch let e {
      print(e)
    }
  }

  func updateFolder(folder: Folder, with name: String) {
    folder.name = name

    do {
      try context.save()
    } catch let e {
      print(e)
    }
  }
}
