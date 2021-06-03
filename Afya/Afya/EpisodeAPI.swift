//
//  EpisodeAPI.swift
//  Afya
//
//  Created by Daniel Oliveira on 02/06/21.
//

import Foundation

@dynamicCallable
struct EpisodeAPI:APIProtocol {

    enum endpoint:EndPoint {
        case episodes(Int)
        case episodesBySeason(Int)
    }
    
    func dynamicallyCall(withArguments args: [EpisodeAPI.endpoint]) -> TargetProtocol {
        return self.run(endpoint: args.first!)
    }
    
    func run(endpoint: EpisodeAPI.endpoint) -> TargetProtocol {
        let api = TargetAPI()
        switch endpoint {
        case .episodes(let serieId):
            api.path = "/shows/\(serieId)/episodes"
        case .episodesBySeason(let seasonId):
            api.path = "/seasons/\(seasonId)/episodes"
        }
        return api
    }
}
