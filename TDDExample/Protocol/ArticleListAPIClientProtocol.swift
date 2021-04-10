//
//  ArticleListAPIClientProtocol.swift
//  TDDExample
//
//  Created by branch10480 on 2021/04/08.
//

import Foundation

protocol ArticleListAPIClientProtocol {
    func fetch(completion: @escaping ([Article]?) -> Void)
}
