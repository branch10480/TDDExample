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
    private let apiClient: ArticleListAPIClientProtocol
    
    init(client: ArticleListAPIClientProtocol = ArticleListAPIClient()) {
        self.apiClient = client

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide).offset(8)
            maker.left.equalToSuperview().offset(16)
            maker.right.equalToSuperview().inset(16)
        }
        
        apiClient.fetch { [weak self] articles in
            guard let firstArticle = articles?.first else {
                return
            }
            self?.titleLabel.text = firstArticle.title
        }
    }

}
