//
//  ProfileViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Property
    var coordinator: ProfileCoordinator?
    var dataArr = [("Категория пользователя","Студент"),("Телефон", "8(800)555-35-35")]
    var imageUrlInString: String = "" {
           didSet {
               guard let url = URL(string: imageUrlInString) else {
                   return
               }
               imageView.loadImage(from: url)
           }
       }
    
    //MARK: Views
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var roundView: UIView!
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavigationBar()
        configureCollectionView()
    }
    private func configure() {
        roundView.layer.cornerRadius = roundView.frame.size.width / 2
        roundView.clipsToBounds = true
        roundView.layer.borderWidth = 1
        roundView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageUrlInString = "https://img.freepik.com/premium-photo/anonymous-hacker-with-hood-and-mask-sitting-next-to-computergenerative-ai_707587-27.jpg"
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        exitButton.layer.cornerRadius = 10
        nameLabel.text = "Иванов Иван Иванович"
        emailLabel.text = "ivan001@mail.ru"
        
    }

    @IBAction func exitButtonTouched(_ sender: Any) {
    }
    
    

}
// MARK: - Private Methods
private extension ProfileViewController {

    func format(phoneNumber: String) -> String {
        let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
        
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options:[], range: range, withTemplate: "")
        
        
        
        
        let maxIndex = number.index(number.startIndex,offsetBy: number.count)
        let regRange = number.startIndex..<maxIndex
        let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
        number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3 $4 $5",options: .regularExpression,range: regRange)
        
        return "+" + number
    }

    func configureNavigationBar() {
        navigationItem.title = "Профиль"
    }
   
    //MARK: - Configuration collection view
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "\(ProfileCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(ProfileCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.contentInset = .init(top: 12, left: 16, bottom: 12, right: 16)
    }

}
// MARK: - UICollection
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ProfileCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? ProfileCollectionViewCell {
            cell.titleName = dataArr[indexPath.row].0
            cell.data = dataArr[indexPath.row].1
            }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = view.frame.width
        return CGSize(width: itemWidth, height: 70)
    
        //return CGSize(width: CGFloat(166), height: CGFloat(189))
       
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return Constants.spaceBetweenRows
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return Constants.spaceBetweenElements
//    }
    
   
    

}
