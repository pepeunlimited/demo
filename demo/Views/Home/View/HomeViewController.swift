//
// Created by Simo Ala-Kotila on 27.1.2020.
// Copyright (c) 2020 Pepe Unlimited Oy. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Atributika
import IGListKit
import StoreKit

class HomeViewController : UIViewController {

    lazy var helper: ListHelper = {
        return ListHelper(vc: self, setConstraints: true)
    }()

    var presenter: HomePresenterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        helper.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.StylesheetColor.White
    }
}

extension HomeViewController : HomeViewDelegate {

    func refresh(_ state: NetworkState) {
        switch state {
        case .loading, .loadingNext:
            self.helper.loadingView.isHidden = false
        default:
            self.helper.loadingView.isHidden = true
        }
        self.helper.adapter.performUpdates(animated: true, completion: nil)
    }
}

extension HomeViewController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let presenter = self.presenter else {
            fatalError("missing presenter!")
        }
        return presenter.objects(for: listAdapter)
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is SKProduct {
            return SKProductViewSectionController()
        }
        fatalError("not supported section controller=\(object)")
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        guard let presenter = self.presenter else {
            fatalError("missing presenter!")
        }
        switch presenter.state() {
        case .idle:
            let emptyView = EmptyView()
            emptyView.text = "Oops, No Product Found!"
            emptyView.retry.isHidden = false
            emptyView.delegate = self
            return emptyView
        case .failure:
            let emptyView = EmptyView()
            emptyView.text = "Oops, Failed fetch Products!"
            emptyView.retry.isHidden = false
            emptyView.delegate = self
            return emptyView
        case .initial, .loading, .loadingNext:
            return nil
        }
    }
}

extension HomeViewController: EmptyViewDelegate {

    func didTapRetry(view: EmptyView) {
        self.presenter?.skproducts()
    }
}