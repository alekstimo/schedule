//
//  DayWeekTableViewCell.swift
//  schedule_app
//
//  
//

import UIKit

class DayWeekTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dayWeekTitleLabel: UILabel!
    var classArray = [Class(name: "ИИТОН", time: "11:30 - 13:05" , number: "123" ),Class(name: "ИИТОН", time: "11:30 - 13:05" , number: "123" ),Class(name: "ИИТОН", time: "11:30 - 13:05" , number: "123" ),Class(name: "ИИТОН", time: "11:30 - 13:05" , number: "123" )]
    var dayWeek: String = "" {
        didSet {
            dayWeekTitleLabel.text = dayWeek
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        configureCollectionView()
       
    }
    //MARK: - Configuration collection view
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "\(InDayClassCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(InDayClassCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.backgroundColor = UIColor(named: "background")
    }

}
// MARK: - UICollection
extension DayWeekTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classArray.count - Int.random(in: 0...3)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(InDayClassCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? InDayClassCollectionViewCell {
            cell.title = classArray[indexPath.row].name
            cell.time = classArray[indexPath.row].time
            cell.number = classArray[indexPath.row].number
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
            }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 299, height: 278)
    
        //return CGSize(width: CGFloat(166), height: CGFloat(189))
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(16)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return Constants.spaceBetweenElements
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name("ThisWeekDetail"), object: Any?.self)
    }
    

}

    

