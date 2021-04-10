//
//  TDDExampleTests.swift
//  TDDExampleTests
//
//  Created by branch10480 on 2021/04/07.
//

import Quick
import Nimble

@testable import TDDExample

class ArticleListSpec: QuickSpec {
    
    override func spec() {
        it("タイトルが表示されている") {
            let vc = ArticleListViewController(client: ArticleListAPIClientStub([
                Article(title: "記事タイトル")
            ]))
            let window = UIWindow()
            window.rootViewController = vc
            window.makeKeyAndVisible()
            
            expect(vc.titleLabel.text).to(equal("記事タイトル"))
        }
    }
}

// MARK: - Stub

class ArticleListAPIClientStub: ArticleListAPIClientProtocol {
    
    private let fakeResponse: [Article]
    
    init(_ response: [Article]) {
        self.fakeResponse = response
    }
    
    func fetch(completion: @escaping ([Article]?) -> Void) {
        completion(fakeResponse)
    }
}
