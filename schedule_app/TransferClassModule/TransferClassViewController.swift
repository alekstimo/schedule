//
//  TransferClassViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 06.05.2023.
//

import UIKit
struct TransferClass {
    var persent: String
    var date: String
    var time: String
    var number: String
    var color: UIColor
}
class TransferClassViewController: UIViewController {
    // MARK: - Constants
    private enum Constants {
        static let horisontalInset: CGFloat = 16
        static let spaceBetweenElements: CGFloat = 12
        static let spaceBetweenRows: CGFloat = 12
    }
    var coordinator: TransferClassCoordinator?
    @IBOutlet weak var collectionView: UICollectionView!
    var classArray = [TransferClass(persent: "88", date: "15.05.2023", time: "13:25 - 15:00", number: "324", color: #colorLiteral(red: 1, green: 0.5411764706, blue: 0.5019607843, alpha: 1) ),TransferClass(persent: "88", date: "15.05.2023", time: "13:25 - 15:00", number: "324", color: #colorLiteral(red: 1, green: 0.5411764706, blue: 0.5019607843, alpha: 1) ),TransferClass(persent: "88", date: "15.05.2023", time: "13:25 - 15:00", number: "324", color: #colorLiteral(red: 1, green: 0.5411764706, blue: 0.5019607843, alpha: 1) ),TransferClass(persent: "100", date: "15.05.2023", time: "13:25 - 15:00", number: "324", color: #colorLiteral(red: 0.3098039216, green: 0.8941176471, blue: 0.5450980392, alpha: 1) ),TransferClass(persent: "100", date: "15.05.2023", time: "13:25 - 15:00", number: "324", color: #colorLiteral(red: 0.3098039216, green: 0.8941176471, blue: 0.5450980392, alpha: 1) ),TransferClass(persent: "50", date: "15.05.2023", time: "13:25 - 15:00", number: "324", color: #colorLiteral(red: 0.9450980392, green: 0.337254902, blue: 0.2901960784, alpha: 1) ),TransferClass(persent: "50", date: "15.05.2023", time: "13:25 - 15:00", number: "324", color: #colorLiteral(red: 0.9450980392, green: 0.337254902, blue: 0.2901960784, alpha: 1) )]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureCollectionView()
    }
    //MARK: - Configuration
    private func configureNavigationBar() {
        navigationItem.title = "ВЫБЕРЕТЕ ВРЕМЯ"
        let leftArroy = UIBarButtonItem(image:resizeImage(image: UIImage(named: "backArrow")!, targetSize: CGSize.init(width: 25, height: 25)),
                                         style: .plain,
                                        target: navigationController,
                                        action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = leftArroy
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "redColor")
    }


    //MARK: - Configuration collection view
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "\(ClassCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(ClassCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = .init(top: 12, left: 16, bottom: 12, right: 16)
    }

}
// MARK: - UICollection
extension TransferClassViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClassCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? ClassCollectionViewCell {
            cell.date = classArray[indexPath.row].date
            cell.time = classArray[indexPath.row].time
            cell.classNumber = classArray[indexPath.row].number
            cell.percent = classArray[indexPath.row].persent
            cell.backgroundColorCell = classArray[indexPath.row].color
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - Constants.horisontalInset * 2 - Constants.spaceBetweenElements) / 2
        return CGSize(width: itemWidth, height: 1.14 * itemWidth)
    
        //return CGSize(width: CGFloat(166), height: CGFloat(189))
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
    }
    
   
    

}
