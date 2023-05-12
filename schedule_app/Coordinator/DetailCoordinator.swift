//
//  DetailCoordinator.swift
//  intro_case
//
//  
//

import Foundation
import UIKit

protocol DetailFlow: class {
    func coordinateToTransfer()
}

class DetailCoordinator: Coordinator, DetailFlow {
    
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let detailViewController = DetailViewController()
        detailViewController.coordinator = self
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func coordinateToTransfer() {
        let transferCoordinator = TransferClassCoordinator(navigationController: navigationController!)
        coordinate(to: transferCoordinator)
    }
   
}
