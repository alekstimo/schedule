//
//  FilterViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 17.05.2023.
//

import UIKit

struct FilterModel {
    var title: String
    var elementsArr: Array<String>
}
class FilterViewController: UIViewController {
    var coordinator: FilterCoordinator?
    var array = [FilterModel(title: "Курс", elementsArr: ["1","2","4","1 маг"]),
                 FilterModel(title: "Группа", elementsArr: ["10","2","61","8"]),
                 FilterModel(title: "Тип занятия", elementsArr: ["лекция","семинар","лабораторное"]),
                 FilterModel(title: "Дисциплина", elementsArr: ["ИИТОН","Дифференциальные уравнения","Комплексный анализ","физкультура"])]
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        filterButton.layer.cornerRadius = 10
    }
    
    @IBAction func filterButtonTouched(_ sender: Any) {
        self.dismiss(animated: true)
    }
    //MARK: - Configuration collection view
    func configureCollectionView() {
        //ClassNameCollectionViewCell
        collectionView.register(UINib(nibName: "\(FilterCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(FilterCollectionViewCell.self)")
        collectionView.register(UINib(nibName: "\(ClassNameCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(ClassNameCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.contentInset = .init(top: 13, left: 20, bottom: 0, right: 20)
    }

}
// MARK: - UICollection
extension FilterViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < array.count - 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FilterCollectionViewCell.self)", for: indexPath)
            if let cell = cell as? FilterCollectionViewCell {
                cell.title = array[indexPath.row].title
                cell.array = array[indexPath.row].elementsArr
            }
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ClassNameCollectionViewCell.self)", for: indexPath)
            if let cell = cell as? ClassNameCollectionViewCell {
                cell.title = array[indexPath.row].title
                cell.array = array[indexPath.row].elementsArr
            }
            
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.row < array.count - 1{
            return CGSize(width: self.view.frame.width, height: 100)
        }
        return CGSize(width: self.view.frame.width, height: 250)

        //return CGSize(width: CGFloat(166), height: CGFloat(189))

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(5)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(6)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? ScrollElementsCollectionViewCell {
//            cell.cellSelected()
//            //collectionView.cell
//            collectionView.moveItem(at: indexPath, to: IndexPath(indexes: [0,0]))
//        }
//    }
   
    

}
