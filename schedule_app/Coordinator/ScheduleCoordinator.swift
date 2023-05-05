//
//  ScheduleCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

protocol ScheduleFlow: class {
    func coordinateToDetail()
    //Поиск и пр
}

class ScheduleCoordinator: Coordinator, ScheduleFlow {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let scheduleViewController = ScheduleViewController()
        scheduleViewController.coordinator = self
        
        navigationController?.pushViewController(scheduleViewController, animated: false)
    }
    //MARK: - Flow Methods
    func coordinateToDetail() {
//        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
//        coordinate(to: detailCoordinator)
    }
}
