//
//  ClassTableViewCell.swift
//  schedule_app
//
//
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var timeLabel: UILabel!
    
    @IBOutlet private weak var transferButton: UIButton!
    @IBOutlet private weak var classNumberLabel: UILabel!
    
    //MARK: - Properties
    var title: String = ""{
        didSet {
            titleLabel.text = title
        }
    }
    var time: String = "" {
        didSet {
            timeLabel.text = "ВРЕМЯ: " + time
        }
    }
    var classNumber: String = "" {
        didSet {
            classNumberLabel.text = "АУДИТОРИЯ: " + classNumber
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        configure()
    }
    
    private func configure() {
        timeLabel.font = .systemFont(ofSize: 13)
        classNumberLabel.font = .systemFont(ofSize: 13)
        transferButton.layer.cornerRadius = 10
    }

    @IBAction func transferButtonTouched(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("transfer"), object: Any?.self)
    }
    
    
}
