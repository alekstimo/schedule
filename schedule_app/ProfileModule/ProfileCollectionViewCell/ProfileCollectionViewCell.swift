//
//  ProfileCollectionViewCell.swift
//  schedule_app
//
//
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    //MARK: Properties
    var titleName: String = "" {
        didSet {
            titleLabel.text = titleName
        }
    }
    var data: String = "" {
        didSet {
            descriptionLabel.text = data
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
