//
//  MainViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Property
    var coordinator: HomeCoordinator?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
       
    }

    //MARK: - Configuration
    private func configureNavigationBar() {
        navigationItem.title = "Главная"
    }
    
    //MARK: - Configuration table view
    func configureTableView() {
        tableView.backgroundColor = UIColor(named: "background")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(UINib(nibName: "\(MenuTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(MenuTableViewCell.self)")
        
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 112
    }

}
// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    
  

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuTableViewCell.self)")
            if let cell = cell as? MenuTableViewCell {
                cell.info = "Нет"
                cell.title = "Текущее занятие"
                cell.iconImage = UIImage(named: "nowIcon")!
            }
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuTableViewCell.self)")
            if let cell = cell as? MenuTableViewCell {
                cell.info = "3 пары"
                cell.title = "Сегодня"
                cell.iconImage = UIImage(named: "todayIcon")!
            }
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuTableViewCell.self)")
            if let cell = cell as? MenuTableViewCell {
                cell.info = "15 пар"
                cell.title = "На этой неделе"
                cell.iconImage = UIImage(named: "thisWeekIcon")!
            }
            return cell ?? UITableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MenuTableViewCell.self)")
            if let cell = cell as? MenuTableViewCell {
                cell.info = "1 пара"
                cell.title = "Перенесенные занятия"
                cell.iconImage = UIImage(named: "transferIcon")!
            }
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            coordinator?.coordinateToNowClass()
        case 1:
            coordinator?.coordinateToTodayClass()
        case 2:
            coordinator?.coordinateToThisWeekClass()
        case 3:
            coordinator?.coordinateToTransferClasses()
        default:
            return
        }
    }
    
}

