//
//  LoginController.swift
//  FardanAssessment
//
//  Created by Salman Jabali on 09/03/23.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var emailTextField: CustomField!
    @IBOutlet weak var passwordTextField: CustomField!
    
    private let viewModel = LoginVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Please enter email and password")
            return
        }

        let params: [String: Any] = [
            "email_mobile": email,
            "password": password,
            "player_id": ""
        ]

        viewModel.login(params: params)
    }
    
    private func goToHomePage() {
        performSegue(withIdentifier: "HomeVCSegue", sender: self)
    }
    
}

