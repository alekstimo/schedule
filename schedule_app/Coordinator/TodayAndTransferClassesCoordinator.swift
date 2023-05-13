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
    func coordinateToDetail(date: Date)
}
class TodayAndTransferClassesCoordinator: Coordinator, TodayAndTransferFlow {
    
    weak var navigationController: UINavigationController?
    var title: String?
    var date = Date()
    init(navigationController: UINavigationController, title: String){
        self.navigationController = navigationController
        self.title = title
    }
    init(navigationController: UINavigationController, title: String, date: Date){
        self.navigationController = navigationController
        self.title = title
        self.date = date
    }
    
    func start() {
        
        let todayClassVC = TodayClassesViewController()
        todayClassVC.coordinator = self
        todayClassVC.navigationTitle = title ?? "Error"
        if date != Date() {
            todayClassVC.currentDate = date
        }
        navigationController?.pushViewController(todayClassVC, animated: true)
    }
    
    func coordinateToTransfer() {
        let transferCoordinator = TransferClassCoordinator(navigationController: navigationController!)
        coordinate(to: transferCoordinator)
    }
    func coordinateToDetail(date: Date) {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController!, date: date)
        coordinate(to: detailCoordinator)
    }
   
}
