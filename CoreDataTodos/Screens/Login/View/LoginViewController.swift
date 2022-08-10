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

  // MARK: - LifeCycles

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  // MARK: - Methods
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
