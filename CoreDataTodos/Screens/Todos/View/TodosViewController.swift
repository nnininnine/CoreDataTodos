//
//  TodosViewController.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 10/8/2565 BE.
//

import UIKit

class TodosViewController: UIViewController {
  // MARK: - Properties

  private var vm: TodosViewModel

  // MARK: - Subviews

  private lazy var tableView: UITableView = {
    let tableView: UITableView = .init()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: vm.cellIdentifier)
    return tableView
  }()

  // MARK: - Init

  init(with folder: Folder) {
    self.vm = .init(with: folder, context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)

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

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    tableView.frame = view.bounds
  }

  // MARK: - Methods

  func setup() {
    view.backgroundColor = .systemBackground

    setupNavBar()
    setupTableView()
  }

  func setupNavBar() {
    title = vm.folder.name

    // add create todo button
    let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(onTapCreateTodo))

    navigationItem.rightBarButtonItem = button
  }

  func setupTableView() {
    view.addSubview(tableView)

    tableView.delegate = self
    tableView.dataSource = self
  }

  @objc func onTapCreateTodo() {
    let alert = UIAlertController(title: "New Todo", message: "Enter new todo", preferredStyle: .alert)
    alert.addTextField()
    alert.addAction(.init(title: "Cancel", style: .cancel))
    alert.addAction(.init(title: "Create", style: .default, handler: { [weak self] _ in
      guard let textField = alert.textFields?.first, let text = textField.text, !text.isEmpty else { return }
      guard let self = self else { return }
      self.vm.createTodo(with: text)
      self.vm.getTodos(by: self.vm.folder)

      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }))

    present(alert, animated: true)
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension TodosViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vm.todos.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: vm.cellIdentifier, for: indexPath)

    var content = cell.defaultContentConfiguration()
    content.text = vm.todos[indexPath.row].name
    cell.contentConfiguration = content

    cell.selectionStyle = .none

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let todo = vm.todos[indexPath.row]
    let alert = UIAlertController(title: "Edit Todo", message: "Edit selected todo", preferredStyle: .alert)
    alert.addTextField(configurationHandler: { textField in
      textField.text = todo.name
    })
    alert.addAction(.init(title: "Cancel", style: .cancel))
    alert.addAction(.init(title: "Update", style: .default, handler: { [weak self] _ in
      guard let textField = alert.textFields?.first, let text = textField.text, !text.isEmpty else { return }
      guard let self = self else { return }

      self.vm.updateTodo(todo: todo, with: text)
      self.vm.getTodos(by: self.vm.folder)

      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }))

    present(alert, animated: true)
  }

  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let todo = vm.todos[indexPath.row]
    let delete = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completionHandler in
      guard let self = self else { return }
      self.vm.deleteTodo(todo: todo)
      self.vm.getTodos(by: self.vm.folder)

      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
      completionHandler(true)
    }

    delete.backgroundColor = .red

    let configuration = UISwipeActionsConfiguration(actions: [delete])

    return configuration
  }
}
