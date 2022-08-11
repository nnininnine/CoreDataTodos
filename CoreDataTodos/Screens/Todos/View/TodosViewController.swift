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
  }
}
