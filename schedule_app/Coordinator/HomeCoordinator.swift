//
//  HomeCoordinator.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import Foundation
import UIKit

protocol HomeFlow: class {
    func coordinateToNowClass()
    func coordinateToTodayClass()
    func coordinateToThisWeekClass()
    func coordinateToTransferClasses()
}

class HomeCoordinator: Coordinator, HomeFlow {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let mainViewController = MainViewController()
        mainViewController.coordinator = self
        
        navigationController?.pushViewController(mainViewController, animated: false)
    }
    //MARK: - Flow Methods
    func coordinateToNowClass() {
        let nowClassCoordinator = NowClassCoordinator(navigationController: navigationController!)
        coordinate(to: nowClassCoordinator)
    }
    func coordinateToTodayClass() {
        let todayClassCoordinator = TodayAndTransferClassesCoordinator(navigationController: navigationController!, title: "СЕГОДНЯ")
        coordinate(to: todayClassCoordinator)
    }
    
    func coordinateToThisWeekClass() {
        
    }
    
    func coordinateToTransferClasses() {
        let todayClassCoordinator = TodayAndTransferClassesCoordinator(navigationController: navigationController!, title: "ПЕРЕНЕСЕННЫЕ ЗАНЯТИЯ")
        coordinate(to: todayClassCoordinator)
    }
    
}
