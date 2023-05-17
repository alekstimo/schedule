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
    var filteredArr = Array<Class>()
    var navigationTitle = " "
    var currentDate = Date()
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var coordinator: TodayAndTransferClassesCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
        customSearchBar()
        NotificationCenter.default.addObserver(self, selector: #selector(TodayAndTransferTransferClass), name: NSNotification.Name("TodayAndTransferTransferClass"), object: nil)
        filteredArr = classesArray
        
    }
    //MARK: -  SearchBar
    @IBAction func searchEditing(_ sender: Any) {
        
        let searchText = searchBar.text
        filteredArr = []
        guard (searchText != nil) && searchText! != "" else {
            filteredArr = classesArray
            self.tableView.reloadData()
            return
        }
        for item in classesArray {
            
            if item.name.lowercased().contains(searchText!.lowercased()) || item.time.lowercased().contains(searchText!.lowercased()) || item.number.contains(searchText!){
                filteredArr.append(item)
            }
            
        }
        
        self.tableView.reloadData()
    }
    
    
    @IBAction func editingSearchBarDidBegin(_ sender: Any) {
        searchBar.layer.borderColor = #colorLiteral(red: 0.9450980392, green: 0.337254902, blue: 0.2901960784, alpha: 1)
    }
    @IBAction func editingSearchBarDidEnd(_ sender: Any) {
        searchBar.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @objc func TodayAndTransferTransferClass(notification: NSNotification) {
        coordinator?.coordinateToTransfer()
    }
    func customSearchBar(){
        if let field = searchBar {
            field.layer.cornerRadius = 22
            field.textColor = .black
            field.tintColor = .black
            field.font = UIFont.systemFont(ofSize: 14)
            field.layer.masksToBounds = true
            field.returnKeyType = .search
            field.layer.borderWidth = 2
        }
        searchBar.placeholder = "Поиск"
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
        return filteredArr.count
    }
  

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ClassTableViewCell.self)")
            if let cell = cell as? ClassTableViewCell {
                cell.title = filteredArr[indexPath.row].name
                cell.time = filteredArr[indexPath.row].time
                cell.classNumber = filteredArr[indexPath.row].number
                
                if currentDate < Calendar.current.date(byAdding: .day, value: 1,to: Date())! {
                    cell.thisDateIsGone()
                }
            }
            return cell ?? UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.coordinateToDetail(date: currentDate)
    }
}

