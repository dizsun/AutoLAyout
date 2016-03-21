//
//  ViewController.swift
//  AutoLAyout
//
//  Created by SunDiz on 16/3/21.
//  Copyright © 2016年 SunDiz. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    var secure:Bool = false { didSet{ updateUI() } }
    var loggedInUser:User? { didSet{ updateUI() } }
    
    private func updateUI(){
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secured Password" : "Password"
        nameLabel.text = loggedInUser?.name
        companyLabel.text = loggedInUser?.company
        imageView.image = loggedInUser?.image
    }
    @IBAction func toggleSecurity() {
        secure = !secure
    }
    @IBAction func login() {
        loggedInUser = User.login(loginField.text ?? "", password: passwordField.text ?? "")
    }
}

extension User{
    var image: UIImage? {
        if let image = UIImage(named: login) {
            return image
        }
        else{
            return UIImage(named: "unknown_user")
        }
    }
}

