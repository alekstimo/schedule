//
//  TodayAndTransferClassesCoordinator.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 06.05.2023.
//

import Foundation
import UIKit

protocol TodayAndTransferFlow: class {
    func coordinateToTransfer()
    func coordinateToDetail()
}
class TodayAndTransferClassesCoordinator: Coordinator, TodayAndTransferFlow {
    
    weak var navigationController: UINavigationController?
    var title: String?
    init(navigationController: UINavigationController, title: String){
        self.navigationController = navigationController
        self.title = title
    }
    
    func start() {
        
        let todayClassVC = TodayClassesViewController()
        todayClassVC.coordinator = self
        todayClassVC.navigationTitle = title ?? "Error"
        navigationController?.pushViewController(todayClassVC, animated: true)
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
