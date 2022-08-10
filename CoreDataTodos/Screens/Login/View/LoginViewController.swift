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

  private lazy var usernameTextField: UITextField = {
    let textField: UITextField = .init(frame: .zero)
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.borderStyle = .roundedRect
    textField.placeholder = "Enter username"
    return textField
  }()

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
    let stackView: UIStackView = .init(arrangedSubviews: [usernameTextField, loginButton])
    stackView.axis = .vertical
    stackView.spacing = 12
    stackView.alignment = .center
    stackView.translatesAutoresizingMaskIntoConstraints = false
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
    title = "Core Data Todos"

    // setup login button
    loginButton.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)

    applyConstraints()
  }

  func applyConstraints() {
    let stackViewConstraints = [
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -24),
      stackView.widthAnchor.constraint(equalToConstant: view.bounds.width - 36),
    ]

    let usernameTextFieldConstraints = [
      usernameTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
      usernameTextField.heightAnchor.constraint(equalToConstant: 44),
    ]

    NSLayoutConstraint.activate(stackViewConstraints)
    NSLayoutConstraint.activate(usernameTextFieldConstraints)
  }

  @objc func onTapLogin() {
    print("call login func")
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
