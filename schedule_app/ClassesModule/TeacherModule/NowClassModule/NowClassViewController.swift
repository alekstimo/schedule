//
//  NowClassViewController.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import UIKit

class NowClassViewController: UIViewController {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    var coordinator: NowClassCoordinator?
    @IBOutlet weak var countStudentsLabel: UILabel!
    @IBOutlet weak var typeClassLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var coursLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    private func configure() {
        titleLabel.text = "Дифференциальные уравнения"
        countStudentsLabel.text = "Студентов: 25 из 29"
        typeClassLabel.text = "Тип занятия: Лекция"
        coursLabel.text = "Курс: 3"
        groupLabel.text = "Группа: 10"
        checkButton.layer.cornerRadius = 10
        navigationItem.title = "ТЕКУЩЕЕ ЗАНЯТИЕ"
        let leftArroy = UIBarButtonItem(image:resizeImage(image: UIImage(named: "backArrow")!, targetSize: CGSize.init(width: 25, height: 25)),
                                         style: .plain, target: navigationController,
                                        action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = leftArroy
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "redColor")
    }
    @IBAction func checkButtonTouched(_ sender: Any) {
        coordinator?.coordinateToCheckIn()
    }
    

}
