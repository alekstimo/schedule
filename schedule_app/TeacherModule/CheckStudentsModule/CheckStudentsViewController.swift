//
//  CheckStudentsViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import UIKit

class CheckStudentsViewController: UIViewController {

    var studentsArray = ["Иванов Иван Иванович","Иванов Иван Иванович","Иванов Иван Иванович","Иванов Иван Иванович","Иванов Иван Иванович","Иванов Иван Иванович","Иванов Иван Иванович","Иванов Иван Иванович","Иванов Иван Иванович","Иванов Иван Иванович"]
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var coordinator: CheckInCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        checkButton.layer.cornerRadius = 10
        configureNavigationBar()
    }


    @IBAction func checkButtonTouched(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    //MARK: - Configuration
    private func configureNavigationBar() {
        navigationItem.title = "ПОСЕЩАЕМОСТЬ"
        let leftArroy = UIBarButtonItem(image:resizeImage(image: UIImage(named: "backArrow")!, targetSize: CGSize.init(width: 25, height: 25)),
                                         style: .plain,
                                        target: navigationController,
                                        action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = leftArroy
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "redColor")
    }
    
    //MARK: - Configuration table view
    func configureTableView() {
        tableView.backgroundColor = UIColor(named: "background")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(UINib(nibName: "\(CheckStudentTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(CheckStudentTableViewCell.self)")
        
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 49
    }
}
// MARK: - UITableViewDataSource
extension CheckStudentsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsArray.count
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    
  

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(CheckStudentTableViewCell.self)")
            if let cell = cell as? CheckStudentTableViewCell {
                cell.student = studentsArray[indexPath.row]
            }
            return cell ?? UITableViewCell()
        
    }
    
}

