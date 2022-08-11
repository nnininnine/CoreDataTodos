//
//  TodosViewController.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 10/8/2565 BE.
//

import UIKit

class TodosViewController: UIViewController {
  // MARK: - Properties

  let folder: Folder

  // MARK: - Subviews

  // MARK: - Init

  init(with folder: Folder) {
    self.folder = folder

    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - LifeCycles

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  // MARK: - Methods

  func setup() {
    view.backgroundColor = .systemBackground
    
    setupNavBar()
  }

  func setupNavBar() {
    // add create todo button
    let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(onTapCreateTodo))

    navigationItem.rightBarButtonItem = button
  }

  @objc func onTapCreateTodo() {
    let alert = UIAlertController(title: "New Todo", message: "Enter new todo", preferredStyle: .alert)
    alert.addTextField()
    alert.addAction(.init(title: "Cancel", style: .cancel))
    alert.addAction(.init(title: "Create", style: .default, handler: { [weak self] _ in
      guard let textField = alert.textFields?.first, let text = textField.text, !text.isEmpty else { return }

//      self?.vm.createFolder(with: text)
//      self?.vm.getFolders()
//
//      DispatchQueue.main.async {
//        self?.tableView.reloadData()
//      }
    }))

    present(alert, animated: true)
  }
}
