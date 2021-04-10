//
//  ArticleListAPIClient.swift
//  TDDExample
//
//  Created by branch10480 on 2021/04/10.
//

import Foundation

final class ArticleListAPIClient: ArticleListAPIClientProtocol {

    func fetch(completion: @escaping ([Article]?) -> Void) {
        guard let url = URL(string: "https://qiita.com/api/v2/items") else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                completion(articles)
            }
        }.resume()
    }
}
