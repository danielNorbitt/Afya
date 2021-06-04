//
//  HomeView.swift
//  Afya
//
//  Created by Daniel Oliveira on 03/06/21.
//

import UIKit
import SnapKit

protocol HomeViewDelegate:class,
                          UITableViewDelegate,
                          UISearchBarDelegate,
                          UISearchControllerDelegate,
                          UISearchResultsUpdating{
}

class HomeView: UIView {
    
    weak var delegate:HomeViewDelegate?
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(SerieTableViewCell.self, forCellReuseIdentifier: "serieCell")
        tableView.backgroundColor = .black
        tableView.delegate = delegate
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 150
        return tableView
    }()
    
    lazy var searchBarController: UISearchController = {
        let searchController = UISearchController()
        searchController.delegate = delegate
        searchController.searchResultsUpdater = delegate
        searchController.searchBar.delegate = delegate
        searchController.searchBar.autocapitalizationType = .none
        return searchController
    }()
    
    func setUpTableView() {
        self.addSubview(tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    func setUpSearchBar(navigationItem:UINavigationItem) {
        navigationItem.searchController = searchBarController
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
}
