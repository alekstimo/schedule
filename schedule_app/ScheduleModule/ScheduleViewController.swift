//
//  ScheduleViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import UIKit

class ScheduleViewController: UIViewController {

    //MARK: - Property
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var coordinator: ScheduleCoordinator?
    var daysNameArr = ["ПН","ВТ","СР","ЧТ","ПТ","СБ","ВС"]
    var daysArr = [String]()
    var countOfSpaces: Int = 0 {
        didSet {
            countOfSpacesPtr = countOfSpaces
        }
    }
    var countOfSpacesPtr = 0
    @IBOutlet weak var monthLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.layer.cornerRadius = 15
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL yyyy"
        monthLabel.text = dateFormatter.string(from: date).uppercased()
        filterButton.layer.cornerRadius = 15
        configureCollectionView()
        generateMonth()
    }
    @IBAction func filterButtonTouched(_ sender: Any) {
        countOfSpacesPtr = countOfSpaces
        collectionView.reloadData()
    }
    private func generateMonth() {
        let calendar = Calendar.current
        let currentDate = Date()
        for i in 1...(calendar.range(of: .day, in: .month, for: currentDate)?.count ??  3) {
            daysArr.append(String(i))
        }
        let firstDay = calendar.date(from: calendar.dateComponents([.year,.month], from: currentDate))
        countOfSpaces = calendar.component(.weekday, from: firstDay!) - 2
        if countOfSpaces < 0 {
            countOfSpaces = 6
        }
        //countOfSpaces = 2
    }
    //MARK: - Configuration collection view
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "\(ScheduleCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(ScheduleCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = .init(top: 0, left: 34, bottom: 0, right: 34)
    }


    
}

// MARK: - UICollection
extension ScheduleViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysArr.count + daysNameArr.count + countOfSpaces
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ScheduleCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? ScheduleCollectionViewCell {
            if (indexPath.row < 7){
                cell.title = daysNameArr[indexPath.row]
            } else if countOfSpacesPtr > 0 {
                cell.title = " "
                countOfSpacesPtr -= 1
            }
            else
            {
                if Bool.random() {
                    cell.select()
                }
                cell.title = daysArr[indexPath.row - 7 - countOfSpaces]
            }
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 32, height: 32)
    
        //return CGSize(width: CGFloat(166), height: CGFloat(189))
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(15)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row > 6 + countOfSpaces {
            let currentDate = Date() // текущая дата
            let calendar = Calendar.current // текущий календарь
            let components = calendar.dateComponents([.month, .year], from: currentDate) // компоненты текущего месяца
            let dateComponents = DateComponents(year:  components.year!, month: components.month!, day: indexPath.row - 6 - countOfSpaces) // компоненты даты
            let date = calendar.date(from: dateComponents)! // полная дата
            

            coordinator?.coordinateToDetail(date: date)
        }
    }
    

}

    

