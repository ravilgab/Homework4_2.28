//
//  ViewController.swift
//  Homework4_2.28
//
//  Created by Ravil on 01.07.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let userName = "Tim"
    private let password = "password"

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingsScreenVC =
            segue.destination as? GreetingsViewController else { return }
        greetingsScreenVC.user = userNameTF.text ?? ""
    }

    @IBAction func logInButtonPressed() {
        if userNameTF.text != userName || passwordTF.text != password {
            credentialsFailAlert()
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotUserNamePressed() {
        let alert = UIAlertController(
            title: "Oops!",
            message: "Your username is Tim",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Ok!", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func forgotPasswordPressed() {
        let alert = UIAlertController(
            title: "Oops!",
            message: "Your password is password",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Thanks!", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func unwindSegue(_ unwindSegue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func credentialsFailAlert() {
        let alert = UIAlertController(
            title: "Invalid username or password",
            message: "Please enter correct username and password",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "showGreetingsVC", sender: nil)
        }
        
        return true
    }
}

