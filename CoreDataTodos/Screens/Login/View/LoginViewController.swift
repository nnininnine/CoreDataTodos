//
//  LoginViewController.swift
//  CoreDataTodos
//
//  Created by 7Peaks on 10/8/2565 BE.
//

import UIKit

class LoginViewController: UIViewController {
  // MARK: - Properties

  // MARK: - Subviews

  private lazy var stackView: UIStackView = {
    let stackView: UIStackView = .init(frame: .zero)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.backgroundColor = .red
    return stackView
  }()

  // MARK: - LifeCycles

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }

  // MARK: - Methods

  func setup() {
    view.addSubview(stackView)
    view.backgroundColor = .systemBackground

    applyConstraints()
  }

  func applyConstraints() {
    let stackViewConstraints = [
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.widthAnchor.constraint(equalToConstant: view.bounds.width - 36),
      stackView.heightAnchor.constraint(equalToConstant: 300)
    ]

    NSLayoutConstraint.activate(stackViewConstraints)
  }
}

// MARK: - Previews

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LoginViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    return LoginViewController().view
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct LoginViewController_Previews: PreviewProvider {
  static var previews: some View {
    LoginViewRepresentable()
  }
}
#endif
