//
//  Coordivator.swift
//  intro_case
//
//
//

import Foundation
import UIKit
protocol Coordinator {
    
    func start()
    func coordinate(to coordinator: Coordinator)
    
}

extension Coordinator {
    
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
