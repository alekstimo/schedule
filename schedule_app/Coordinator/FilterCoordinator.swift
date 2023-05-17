//
//  FilterCoordinator.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 17.05.2023.
//

import Foundation
import UIKit
class FilterCoordinator: Coordinator {

    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let filterVC = FilterViewController()
        filterVC.coordinator = self
        filterVC.modalTransitionStyle = .crossDissolve
        //filterVC.modalPresentationStyle = .overCurrentContext
        navigationController!.present(filterVC,animated: true, completion: nil)
    }
    
   
}
