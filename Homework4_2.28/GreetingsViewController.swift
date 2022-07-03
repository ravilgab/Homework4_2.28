//
//  GreetingsViewController.swift
//  Homework4_2.28
//
//  Created by Ravil on 03.07.2022.
//

import UIKit

class GreetingsViewController: UIViewController {
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
    var user = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        greetingsLabel.text = "Welcome \(user)!"
    }
}
