//
//  ClassCollectionViewCell.swift
//  schedule_app
//
//
//

import UIKit

class ClassCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var classNumberLabel: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    //MARK: - Perpeties
    var percent: String = "" {
        didSet {
            percentLabel.text = percent + "%"
        }
    }
    var classNumber: String = "" {
        didSet {
            classNumberLabel.text = "Аудитория: " + classNumber
        }
    }
    var time: String = "" {
        didSet {
            timeLable.text = "Время: " + time
        }
    }
    var date: String = "" {
        didSet {
            dateLabel.text = "Дата: " + date
        }
    }
    var backgroundColorCell: UIColor = UIColor(named: "redColor")! {
        didSet {
            self.backgroundColor = backgroundColorCell
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
