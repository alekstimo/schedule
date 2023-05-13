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
        
        switch(Int.random(in: 1...2)) {
        case 1:
            let nowClassViewController = NowClassViewController()
            nowClassViewController.coordinator = self
            navigationController?.pushViewController(nowClassViewController, animated: true)
        case 2:
            let nowClassViewController = NowClassStudentViewController()
            nowClassViewController.coordinator = self
            navigationController?.pushViewController(nowClassViewController, animated: true)
            
        default:
            print("error")
        }
       
        
    }
    
    func coordinateToCheckIn() {
        
        let checkInCoordinator = CheckInCoordinator(navigationController: navigationController!)
        coordinate(to: checkInCoordinator)
        
        
    }
   
}
