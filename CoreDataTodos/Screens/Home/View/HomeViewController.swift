//
//  HomeViewController.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 8/8/2565 BE.
//

import UIKit

class HomeViewController: UIViewController {
  // MARK: - Properties

  // MARK: - LifeCycles

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground
    title = "Core Data Todos"
  }

  // MARK: - Methods
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
