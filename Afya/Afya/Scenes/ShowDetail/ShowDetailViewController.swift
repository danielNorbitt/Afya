//
//  ShowDetailViewController.swift
//  Afya
//
//  Created by Daniel Oliveira on 04/06/21.
//

import UIKit

class ShowDetailViewController: UIViewController {

    var viewModel:ShowDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ShowDetailViewController: HasCustomView{
    typealias CustomView = ShowDetailView
    
    override func loadView() {
        let customView = ShowDetailView()
//        customView.delegate = self
        view = customView
    }
}
