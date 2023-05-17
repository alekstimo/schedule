//
//  ScheduleCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

protocol ScheduleFlow: class {
    func coordinateToDetail(date: Date)
    func coordinareToFilter()
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
    func coordinateToDetail(date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, yyyy"
        let dateString = dateFormatter.string(from: date)
        let thisDayClassCoordinator = TodayAndTransferClassesCoordinator(navigationController: navigationController!, title: dateString,date: date)
        coordinate(to: thisDayClassCoordinator)
    }
    func coordinareToFilter() {
        let filterCoordinator = FilterCoordinator(navigationController: navigationController!)
        coordinate(to: filterCoordinator)
    }
}
