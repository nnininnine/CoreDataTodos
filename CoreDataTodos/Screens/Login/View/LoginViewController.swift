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

  private lazy var loginButton: UIButton = {
    let button: UIButton = .init(configuration: .plain())
    button.configuration?.title = "Login"
    button.configuration?.baseForegroundColor = .systemBackground
    button.backgroundColor = .label
    button.configuration?.contentInsets = .init(top: 8, leading: 36, bottom: 8, trailing: 36)
    button.layer.cornerRadius = 8
    return button
  }()

  private lazy var stackView: UIStackView = {
    let stackView: UIStackView = .init(arrangedSubviews: [loginButton])
    stackView.axis = .vertical
    stackView.spacing = 8
    stackView.alignment = .center
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.backgroundColor = .red
    stackView.sizeToFit()
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
