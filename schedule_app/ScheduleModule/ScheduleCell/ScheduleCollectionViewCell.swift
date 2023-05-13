//
//  ScheduleCollectionViewCell.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 13.05.2023.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    private var cellSelected = false
    func select() {
        cellSelected = !cellSelected
            if cellSelected {
                titleLabel.textColor = .black
                self.backgroundColor = .white
            } else {
                titleLabel.textColor = .white
                self.backgroundColor = UIColor(named: "lightRedColor")
            }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
    }

}
