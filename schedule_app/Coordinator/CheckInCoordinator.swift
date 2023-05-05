//
//  CheckInCoordinator.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import Foundation
import UIKit

class CheckInCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let checkViewController = CheckStudentsViewController()
        checkViewController.coordinator = self
        
        navigationController?.pushViewController(checkViewController, animated: true)
    }
   
}
