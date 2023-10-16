//
//  ViewController.swift
//  Oreo Fashion
//
//  Created by AALA mac on 12/10/2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBAction func signInBtn(_ sender: Any) {
//        let vc = SignInViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if AuthManager.shared.isSignedIn{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

