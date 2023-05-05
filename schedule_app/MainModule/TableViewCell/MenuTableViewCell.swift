//
//  MenuTableViewCell.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 05.05.2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    //MARK: - Properties
    var iconImage: UIImage = UIImage(named: "logo")! {
        didSet{
            iconImageView.image = iconImage
        }
    }
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var info: String = "" {
        didSet {
            infoLabel.text = info
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        containerView.layer.cornerRadius = 10
    }
}
