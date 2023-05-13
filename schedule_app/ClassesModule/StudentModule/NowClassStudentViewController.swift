//
//  NowClassStudentViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 13.05.2023.
//

import UIKit

class NowClassStudentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var informationArr = [("Преподаватель:","Иванов Иван Иванович"),("Аудитория:","123"),("Текущая оценка посещаемости:","88%"),("Время провеления:","9:45 - 11:30")]
    var coordinator: NowClassCoordinator?
    var titleName: String = "" {
        didSet {
            titleLabel.text = titleName
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "background")
        configureNavigationBar()
        configureTableView()
        
    }
    //MARK: - Configuration
    private func configureNavigationBar() {
        navigationItem.title = "ТЕКУЩЕЕ ЗАНЯТИЕ"
        let leftArroy = UIBarButtonItem(image:resizeImage(image: UIImage(named: "backArrow")!, targetSize: CGSize.init(width: 25, height: 25)),
                                         style: .plain,
                                        target: navigationController,
                                        action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = leftArroy
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "redColor")
        titleName = "Комплексный анализ"
    }
    
    //MARK: - Configuration table view
    func configureTableView() {
        tableView.backgroundColor = UIColor(named: "background")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(UINib(nibName: "\(NowClassStudentTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(NowClassStudentTableViewCell.self)")
        
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 81
    }

    
}
// MARK: - UITableViewDataSource
extension NowClassStudentViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationArr.count
        
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    
  

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(NowClassStudentTableViewCell.self)")
            if let cell = cell as? NowClassStudentTableViewCell {
                cell.title = informationArr[indexPath.row].0
                cell.information = informationArr[indexPath.row].1
            }
            return cell ?? UITableViewCell()
     
    }
    
}

