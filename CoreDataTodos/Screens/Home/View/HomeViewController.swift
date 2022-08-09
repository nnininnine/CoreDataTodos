//
//  HomeViewController.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 8/8/2565 BE.
//

import UIKit

class HomeViewController: UIViewController {
  // MARK: - Properties

  private let vm: HomeViewModel = .init()

  // MARK: - Subviews

  private lazy var tableView: UITableView = {
    let tableView: UITableView = .init()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: vm.cellIdentifier)
    return tableView
  }()

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
    title = "Core Data Todos"

    setupTableView()
  }

  func setupTableView() {
    view.addSubview(tableView)

    tableView.delegate = self
    tableView.dataSource = self
  }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return vm.todos.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: vm.cellIdentifier, for: indexPath)

    var content = cell.defaultContentConfiguration()
    content.text = vm.todos[indexPath.row].name
    cell.contentConfiguration = content

    return cell
  }
}

// MARK: - Previews

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct HomeViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    return HomeViewController().view
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct HomeViewController_Previews: PreviewProvider {
  static var previews: some View {
    HomeViewRepresentable()
  }
}
#endif
