//
//  CoreDataTodosTests.swift
//  CoreDataTodosTests
//
//  Created by 7Peaks on 15/8/2565 BE.
//

@testable import CoreDataTodos
import XCTest

class CoreDataTodosTests: XCTestCase {
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testCreateFolder() throws {
    let context = TestCoreDataStack.shared.persistentContainer.viewContext

    let vm: CoreDataTodos.HomeViewModel = .init(with: context)
    let folderName = "Folder 01"
    vm.createFolder(with: folderName)
    vm.getFolders()
    XCTAssertTrue(vm.folders.contains(where: { $0.name == folderName }))
  }

  func testUpdateFolder() throws {
    let context = TestCoreDataStack.shared.persistentContainer.viewContext
    let vm: CoreDataTodos.HomeViewModel = .init(with: context)
    let folderName = "Folder"
    let updatedName = "New Folder"

    vm.createFolder(with: folderName)
    vm.getFolders()

    XCTAssertNotNil(vm.folders.first(where: { $0.name == folderName }))
    let folder = vm.folders.first(where: { $0.name == folderName })!

    vm.updateFolder(folder: folder, with: updatedName)
    vm.getFolders()

    XCTAssertTrue(vm.folders.contains(where: { $0.name == updatedName }))
  }

  func testDeleteFolder() throws {
    let context = TestCoreDataStack.shared.persistentContainer.viewContext
    let vm: CoreDataTodos.HomeViewModel = .init(with: context)
    let folderName = "Folder"

    vm.createFolder(with: folderName)
    vm.getFolders()

    XCTAssertNotNil(vm.folders.first(where: { $0.name == folderName }))
    let folder = vm.folders.first(where: { $0.name == folderName })!

    vm.deleteFolder(folder: folder)
    vm.getFolders()

    XCTAssertFalse(vm.folders.contains(where: { $0.name == folderName }))
  }

  // MARK: - TodosViewModel unit test

  func testCreateTodo() throws {
    // create context
    let context = TestCoreDataStack.shared.persistentContainer.viewContext

    // declare home view model
    let homeVM: CoreDataTodos.HomeViewModel = .init(with: context)

    // create folder
    let folderName = "Folder"

    homeVM.createFolder(with: folderName)
    homeVM.getFolders()

    XCTAssertNotNil(homeVM.folders.first(where: { $0.name == folderName }))
    let folder = homeVM.folders.first(where: { $0.name == folderName })!

    // declare todos view model
    let todosVM: CoreDataTodos.TodosViewModel = .init(with: folder, context: context)
    
    // create todo
    let todoName: String = "some todo for test"
    
    todosVM.createTodo(with: todoName)
    todosVM.getTodos(by: folder)
    
    XCTAssertTrue(todosVM.todos.contains(where: { $0.name == todoName }))
  }

  func testUpdateTodo() throws {}

  func testDeleteTodo() throws {}
}
