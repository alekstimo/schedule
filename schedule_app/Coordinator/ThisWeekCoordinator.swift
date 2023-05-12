//
//  ThisWeekCoordinator.swift
//  schedule_app
//
//  
//

import Foundation
import UIKit


class ThisWeekCoordinator: Coordinator, TodayAndTransferFlow {
    
    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let thisWeekClassVC = ThisWeekViewController()
        thisWeekClassVC.coordinator = self
        navigationController?.pushViewController(thisWeekClassVC, animated: true)
    }
    
    func coordinateToTransfer() {
        let transferCoordinator = TransferClassCoordinator(navigationController: navigationController!)
        coordinate(to: transferCoordinator)
    }
    func coordinateToDetail() {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController!)
        coordinate(to: detailCoordinator)
    }
   
}
