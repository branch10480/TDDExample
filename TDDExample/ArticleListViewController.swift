//
//  ArticleListViewController.swift
//  TDDExample
//
//  Created by branch10480 on 2021/04/07.
//

import UIKit
import SnapKit

class ArticleListViewController: UIViewController {

    private(set) var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview().offset(16)
            maker.right.equalToSuperview().inset(16)
        }
    }

}
