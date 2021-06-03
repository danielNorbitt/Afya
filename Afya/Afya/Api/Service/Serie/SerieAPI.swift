//
//  SerieAPI.swift
//  Afya
//
//  Created by Daniel Oliveira on 01/06/21.
//

import Foundation

@dynamicCallable
struct SerieAPI:APIProtocol {

    enum endpoint:EndPoint {
        case series
        case seriesPage(Int)
        case serie(Int)
        case searchByName(String)
    }
    
    func dynamicallyCall(withArguments args: [SerieAPI.endpoint]) -> TargetProtocol {
        return self.run(endpoint: args.first!)
    }
    
    func run(endpoint: SerieAPI.endpoint) -> TargetProtocol {
        let api = TargetAPI()
        switch endpoint {
        case .series:
            api.path = "/shows"
        case .serie(let id):
            api.path = "/shows/\(id)"
        case .seriesPage(let numberPage):
            api.path = "/shows?page=\(numberPage)"
        case .searchByName(let nameSerie):
            api.path = "/search/shows?q=\(nameSerie)"
        }
        return api
    }
}
