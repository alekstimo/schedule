//
//  TabBarController.swift
//  intro_case
//
// 
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.layer.masksToBounds = true
        self.tabBar.barStyle = .default
        self.tabBar.barTintColor = .white
        //self.tabBar.bar
        self.tabBar.tintColor = #colorLiteral(red: 0.9450980392, green: 0.337254902, blue: 0.2901960784, alpha: 1)
        self.tabBar.backgroundColor = .white
        
        
        self.tabBar.layer.cornerRadius = 20
        
        
    }
    var coordinator: TabBarCoordinator?
}
