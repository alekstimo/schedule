//
//  LogInViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var logInButton: UIButton!
    //MARK: - Property
    var coordinator: StartCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }

    @IBAction func logInButtonTouched(_ sender: Any) {
        coordinator?.coordinateToTabBar()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
