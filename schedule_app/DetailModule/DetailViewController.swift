//
//  DetailViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Property
    var coordinator: DetailCoordinator?
    
    @IBOutlet weak var mainInfotmationView: UIView!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var coursLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var classNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - Properties
    var titleText: String = ""{
        didSet {
            titleLabel.text = titleText
        }
    }
    var type: String = ""{
        didSet {
            typeLabel.text = "Тип занятия: " + type
        }
    }
    var group: String = ""{
        didSet {
            groupLabel.text = "Группа: " + group
        }
    }
    var cours: String = ""{
        didSet {
            coursLabel.text = "Курс: " + cours
        }
    }
    var time: String = ""{
        didSet {
            timeLabel.text = "Время: " + time
        }
    }
    var date: String = ""{
        didSet {
            dateLabel.text = "Дата: " + date
        }
    }
    var classNumber: String = ""{
        didSet {
            classNumberLabel.text = "Аудитирия: " +  classNumber
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavigationBar()
    }
    private func configure(){
        mainInfotmationView.layer.cornerRadius = 10
        transferButton.layer.cornerRadius = 10
        transferButton.setTitle("ПЕРЕНЕСТИ", for: .normal)
        
        
        titleText = "Дифференциальные уравнения"
        type = "Лекция"
        cours = "3"
        date = "06.05.2023"
        time = "13:25 - 15:00"
        classNumber = "234"
        group = "10"
    }
    @IBAction func transferButtonTouched(_ sender: Any) {
        coordinator?.coordinateToTransfer()
    }
    
    //MARK: - Configuration
    private func configureNavigationBar() {
        navigationItem.title = "ПРЕДСТОЯЩЕЕ ЗАНЯТИЕ"
        let leftArroy = UIBarButtonItem(image:resizeImage(image: UIImage(named: "backArrow")!, targetSize: CGSize.init(width: 25, height: 25)),
                                         style: .plain,
                                        target: navigationController,
                                        action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = leftArroy
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "redColor")
    }

}
