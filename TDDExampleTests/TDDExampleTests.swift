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
        
        it("タイトルの一覧が表示されている") {
            let vc = ArticleListViewController(client: ArticleListAPIClientStub([
                Article(title: "記事タイトル")
            ]))
            let window = UIWindow()
            window.rootViewController = vc
            window.makeKeyAndVisible()
            sleep(1)
            
            guard let cell = vc.tableView.dataSource?.tableView(
                    vc.tableView,
                    cellForRowAt: IndexPath(row: 0, section: 0)
            )
            as? ArticleListCell
            else {
                fail()
                return
            }
            expect(cell.titleLabel.text).to(equal("記事タイトル"))
            
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
