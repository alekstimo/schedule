//
//  FilterCollectionViewCell.swift
//  schedule_app
//
//  
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    var array = Array<String>()
    var title: String = "" {
        didSet {
            titleLabel.text = title.uppercased()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       configure()
        configureCollectionView() 
    }
    private func configure() {
        titleLabel.font = .systemFont(ofSize: 20 ,weight: .bold)
    }
    //MARK: - Configuration collection view
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "\(ScrollElementsCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(ScrollElementsCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = .init(top: 13, left: 20, bottom: 0, right: 20)
    }

}
// MARK: - UICollection
extension FilterCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ScrollElementsCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? ScrollElementsCollectionViewCell {
            cell.title = array[indexPath.row]
            }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = CGFloat(array[indexPath.row].count * 10 + 66 )
        return CGSize(width: itemWidth, height: CGFloat(30))
        //return CGSize(width: 60, height: 30)
    
        //return CGSize(width: CGFloat(166), height: CGFloat(189))
       
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return Constants.spaceBetweenRows
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(6)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ScrollElementsCollectionViewCell {
            if cell.cellSelected() {
                array.swapAt(0, indexPath.row)
                collectionView.moveItem(at: indexPath, to: IndexPath(indexes: [0,0]))
            }
        }
    }
   
    

}
