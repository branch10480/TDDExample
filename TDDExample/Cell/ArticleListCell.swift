//
//  ArticleListCell.swift
//  TDDExample
//
//  Created by branch10480 on 2021/04/10.
//

import UIKit

class ArticleListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ title: String) {
        titleLabel.text = title
    }
    
}
