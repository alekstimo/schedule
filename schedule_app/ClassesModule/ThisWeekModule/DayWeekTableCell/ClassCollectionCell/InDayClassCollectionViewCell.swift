//
//  InDayClassCollectionViewCell.swift
//  schedule_app
//
//
//

import UIKit

class InDayClassCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var classNumberLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var transferButton: UIButton!
    
    //MARK: - Properties
    var title: String = ""{
        didSet {
            titleLabel.text = title
        }
    }
    var time: String = ""{
        didSet {
            timeLabel.text = "Время: " + time
        }
    }
    var number: String = ""{
        didSet {
            classNumberLabel.text = "Аудитория: " + number
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        transferButton.layer.cornerRadius = 10
    }

    @IBAction func transferButtonTouched(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ThisWeekTransfer"), object: Any?.self)
    }
}
