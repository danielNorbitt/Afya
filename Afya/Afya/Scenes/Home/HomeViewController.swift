//
//  HomeViewController.swift
//  Afya
//
//  Created by Daniel Oliveira on 25/05/21.
//

import UIKit
import Combine

fileprivate typealias SerieDataSource = UITableViewDiffableDataSource<HomeViewController.Section,Serie>
fileprivate typealias SerieSnapShot = NSDiffableDataSourceSnapshot<HomeViewController.Section,Serie>

class HomeViewController: UIViewController {
    
    var viewModel:HomeViewModel<SerieService>?
    
    private var cancellables: Set<AnyCancellable> = []
    
    private var dataSource: SerieDataSource!
    
    // MARK Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        
        customView.setUpTableView()
        
        customView.setUpSearchBar(navigationItem: self.navigationItem)

        setUpDataSource()
        
        bindViewModel()
        
        viewModel?.fetchSeries()
        
    }

    private func bindViewModel() {

        viewModel?.$series
            .sink { [weak self] (series) in self?.renderSeries(series: series) }
            .store(in: &cancellables)
        
        viewModel?.$seachText
            .receive(on: RunLoop.main)
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { text in
                debugPrint(text)
            }.store(in: &cancellables)
    }
    
    private func setUpDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: customView.tableView, cellProvider: { (tableView, indexPath, serie) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "serieCell", for: indexPath) as? SerieTableViewCell
            cell?.configure(with: serie)
            return cell
        })
    }
    
    private func renderSeries(series:[Serie]) {
        var snapShot = SerieSnapShot()
        snapShot.appendSections([.main])
        snapShot.appendItems(series, toSection: .main)
        
        DispatchQueue.main.async { [weak self] in
            self?.dataSource.apply(snapShot, animatingDifferences: true)
        }
    }
    
}

extension HomeViewController: HomeViewDelegate {

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let isCanLoadMore = viewModel?.isCanLoadMore, isCanLoadMore != false else { return }
        
        if dataSource.snapshot().numberOfItems(inSection: .main) - 1 == indexPath.row {
            viewModel?.isCanLoadMore = false
            viewModel?.fetchSeries()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
//        searchController
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel?.seachText = searchText
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel?.seachText = ""
    }
    
}

extension HomeViewController: HasCustomView{
    typealias CustomView = HomeView
    
    override func loadView() {
        let customView = HomeView()
        customView.delegate = self
        view = customView
    }
}

extension HomeViewController {
    fileprivate enum Section {
        case main
    }
}
