//
//  TDDExampleTests.swift
//  TDDExampleTests
//
//  Created by branch10480 on 2021/04/07.
//

import Quick
import Nimble
import SafariServices

@testable import TDDExample

class ArticleListSpec: QuickSpec {
    
    private var articleListVC: ArticleListViewController!
    
    override func spec() {
        
        beforeSuite {
            self.articleListVC = ArticleListViewController(client: ArticleListAPIClientStub([
                Article(title: "記事タイトル", url: "https://test")
            ]))
        }
        
        it("タイトルの一覧が表示されている") {
            let window = UIWindow()
            let vc: ArticleListViewController = self.articleListVC
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
        
        it("記事をタップして詳細画面が表示されること") {
            let window = UIWindow()
            let vc: ArticleListViewController = self.articleListVC
            window.rootViewController = vc
            window.makeKeyAndVisible()
            sleep(1)
            
            vc.tableView(vc.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
            
            expect(vc.presentedViewController is SFSafariViewController).to(beTrue())
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
