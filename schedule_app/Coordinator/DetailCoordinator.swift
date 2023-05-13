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
    var date = Date()
    init(navigationController: UINavigationController, date: Date){
        self.navigationController = navigationController
        self.date = date
    }
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let detailViewController = DetailViewController()
        detailViewController.coordinator = self
        detailViewController.currentDate = date
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func coordinateToTransfer() {
        let transferCoordinator = TransferClassCoordinator(navigationController: navigationController!)
        coordinate(to: transferCoordinator)
    }
   
}
