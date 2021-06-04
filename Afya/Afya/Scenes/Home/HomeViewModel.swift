//
//  HomeViewModel.swift
//  Afya
//
//  Created by Daniel Oliveira on 03/06/21.
//

import Foundation

final class HomeViewModel<T:SerieServiceProtocol>: ObservableObject {
    
    let serieService:T
    
    @Published private(set) var series:[Serie] = []
    
    @Published var seachText:String = ""
    
    var currentPage:Int = -1
    
    var isCanLoadMore = false
    
    init(serieService:T) {
        self.serieService = serieService
    }
    
    func fetchSeries() {
        serieService.getSeriesByPage(on: currentPage+1) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let series):
                self.series += series
                self.isCanLoadMore = true
                self.currentPage += 1
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    func searchSeries(by text:String) {
        serieService.getSearcheSeriesByName(by: text) { (result) in
            switch result {
            case .success(let searchResult):
                self.series = searchResult.map { $0.show }
                self.isCanLoadMore = false
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

