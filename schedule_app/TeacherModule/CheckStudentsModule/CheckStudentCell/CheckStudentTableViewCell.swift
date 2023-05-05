//
//  CheckStudentTableViewCell.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import UIKit

class CheckStudentTableViewCell: UITableViewCell {

    @IBOutlet private weak var studentFIOLabel: UILabel!
    
    var student: String = "" {
        didSet{
            studentFIOLabel.text = student
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

   
}
