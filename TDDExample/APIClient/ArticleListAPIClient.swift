//
//  ArticleListAPIClient.swift
//  TDDExample
//
//  Created by branch10480 on 2021/04/10.
//

import Foundation

final class ArticleListAPIClient: ArticleListAPIClientProtocol {

    func fetch(completion: @escaping ([Article]?) -> Void) {
        // テストを最短で通すため、まずは空にする
    }
}
