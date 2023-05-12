//
//  TodayClassesViewController.swift
//  schedule_app
//
//  
//

import UIKit

struct Class {
    var name: String
    var time: String
    var number: String
}

class TodayClassesViewController: UIViewController {

    
    var classesArray = [Class(name: "Дифференциальные уравнения", time: "13:25 - 15:00", number: "324"),Class(name: "Дифференциальные уравнения", time: "13:25 - 15:00", number: "324"),Class(name: "Дифференциальные уравнения", time: "13:25 - 15:00", number: "324"),Class(name: "Дифференциальные уравнения", time: "13:25 - 15:00", number: "324"),Class(name: "Дифференциальные уравнения", time: "13:25 - 15:00", number: "324"),Class(name: "Дифференциальные уравнения", time: "13:25 - 15:00", number: "324"),Class(name: "Дифференциальные уравнения", time: "13:25 - 15:00", number: "324")]
    var navigationTitle = " "
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var coordinator: TodayAndTransferClassesCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
        NotificationCenter.default.addObserver(self, selector: #selector(transfer), name: NSNotification.Name("transfer"), object: nil)
        
    }
    
    @objc func transfer(notification: NSNotification) {
        coordinator?.coordinateToTransfer()
    }
    


    //MARK: - Configuration
    private func configureNavigationBar() {
        navigationItem.title = navigationTitle
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
        
        tableView.register(UINib(nibName: "\(ClassTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(ClassTableViewCell.self)")
        
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 160
    }
}
// MARK: - UITableViewDataSource
extension TodayClassesViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classesArray.count
    }
  

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ClassTableViewCell.self)")
            if let cell = cell as? ClassTableViewCell {
                cell.title = classesArray[indexPath.row].name
                cell.time = classesArray[indexPath.row].time
                cell.classNumber = classesArray[indexPath.row].number
            }
            return cell ?? UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.coordinateToDetail()
    }
}

