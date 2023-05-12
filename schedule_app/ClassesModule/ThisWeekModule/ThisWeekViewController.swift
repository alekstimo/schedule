//
//  ThisWeekViewController.swift
//  schedule_app
//
//  
//

import UIKit

class ThisWeekViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var days = ["Сегодня","Завтра","В четверг","В пятницу"]
    var coordinator: ThisWeekCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "background")
        configureNavigationBar()
        configureTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(ThisWeekTransfer), name: NSNotification.Name("ThisWeekTransfer"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ThisWeekDetail), name: NSNotification.Name("ThisWeekDetail"), object: nil)
        
    }
    
    @objc func ThisWeekTransfer(notification: NSNotification) {
        coordinator?.coordinateToTransfer()
    }
    @objc func ThisWeekDetail(notification: NSNotification) {
        coordinator?.coordinateToDetail()
    }
    //MARK: - Configuration
    private func configureNavigationBar() {
        navigationItem.title = "НА ЭТОЙ НЕДЕЛЕ"
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
        
        tableView.register(UINib(nibName: "\(DayWeekTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(DayWeekTableViewCell.self)")
        
       
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 380
    }


    /*
    Таблица с ячейками - Сегодня/ завтра/ средя и тд. + коллекция с занятиями
    */

}
// MARK: - UITableViewDataSource
extension ThisWeekViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
        
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    
  

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DayWeekTableViewCell.self)")
            if let cell = cell as? DayWeekTableViewCell {
                cell.dayWeek = days[indexPath.row]
            }
            return cell ?? UITableViewCell()
     
    }
    
}

