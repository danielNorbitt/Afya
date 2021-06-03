//
//  HomeViewController.swift
//  Afya
//
//  Created by Daniel Oliveira on 25/05/21.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    var viewModel:HomeViewModel<SerieService>?
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        self.view.backgroundColor = .systemBlue
        
        bindViewModel()
        viewModel?.fetchSeries()
         
    }
    
    private func bindViewModel() {
        viewModel?.$series
            .sink { (series) in print(series) }
            .store(in: &cancellables)
    }
}
