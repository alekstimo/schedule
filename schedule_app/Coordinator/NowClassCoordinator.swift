//
//  NowClassCoordinator.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import Foundation
import UIKit

protocol NowClassFlow: class {
    func coordinateToCheckIn()
}
class NowClassCoordinator: Coordinator, NowClassFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let nowClassViewController = NowClassViewController()
        nowClassViewController.coordinator = self
        
        navigationController?.pushViewController(nowClassViewController, animated: true)
    }
    
    func coordinateToCheckIn() {
        
        let checkInCoordinator = CheckInCoordinator(navigationController: navigationController!)
        coordinate(to: checkInCoordinator)
        
        
    }
   
}
