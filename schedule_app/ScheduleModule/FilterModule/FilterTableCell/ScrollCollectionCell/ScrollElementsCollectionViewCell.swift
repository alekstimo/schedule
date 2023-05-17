//
//  ScrollElementsCollectionViewCell.swift
//  schedule_app
//
//  Created by Кирилл Зезюков on 17.05.2023.
//

import UIKit

class ScrollElementsCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var contentLabel: UILabel!
    var title: String = "" {
        didSet {
            contentLabel.text = title
        }
    }
    private var select = false
    func cellSelected() -> Bool{
        select = !select
        if select {
            contentLabel.textColor = .white
            self.contentView.backgroundColor = #colorLiteral(red: 1, green: 0.5411764706, blue: 0.5019607843, alpha: 1)
        } else {
            contentLabel.textColor = .black
            self.contentView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        }
        return select
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       configure()
    }

    private func configure() {
        contentLabel.font = .systemFont(ofSize: 20, weight: .medium)
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1
        
    }
    override func prepareForReuse() {
        contentLabel.textColor = .black
        self.contentView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
    }
}
