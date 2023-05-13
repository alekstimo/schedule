//
//  NowClassStudentTableViewCell.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 13.05.2023.
//

import UIKit

class NowClassStudentTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var informationLabel: UILabel!
    
    var title: String = "" {
        didSet{
            titleLabel.text = title
        }
    }
    var information: String = "" {
        didSet{
            informationLabel.text = information
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}
