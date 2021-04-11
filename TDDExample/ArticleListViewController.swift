//
//  ArticleListViewController.swift
//  TDDExample
//
//  Created by branch10480 on 2021/04/07.
//

import UIKit
import SnapKit

class ArticleListViewController: UIViewController {

    private(set) var titleLabel: UILabel = UILabel()
    private(set) var tableView: UITableView = UITableView()

    private let apiClient: ArticleListAPIClientProtocol
    private let cellId = "cell"
    private var items: [Article] = []
    
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

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(self.view.safeAreaLayoutGuide).offset(8)
            maker.left.equalToSuperview().offset(16)
            maker.right.equalToSuperview().inset(16)
        }
        
        // TableView.
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.right.equalToSuperview()
            maker.left.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(.init(nibName: "ArticleListCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        
        apiClient.fetch { [weak self] articles in
            self?.items = articles ?? []
            self?.tableView.reloadData()
        }
    }

}

// MARK: - UITableViewDataSource
extension ArticleListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ArticleListCell
        cell.configure(items[indexPath.row].title)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ArticleListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
