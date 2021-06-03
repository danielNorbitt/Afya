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
    
    init(serieService:T) {
        self.serieService = serieService
    }
    
    func fetchSeries() {
        serieService.getSeriesByPage(on: 1) { [weak self] (result) in
            switch result {
            case .success(let series):
                self?.series = series
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}

