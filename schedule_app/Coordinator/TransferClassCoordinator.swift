//
//  TransferClassCoordinator.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 12.05.2023.
//

import Foundation
import UIKit

class TransferClassCoordinator: Coordinator {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let transferVC = TransferClassViewController()
        transferVC.coordinator = self
        
        navigationController?.pushViewController(transferVC, animated: true)
    }
   
}
