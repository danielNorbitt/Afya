//
//  EpisodeService.swift
//  Afya
//
//  Created by Daniel Oliveira on 02/06/21.
//

import Foundation

protocol EpisodeServiceProtocol:RemoteService{
    func getEpisodesOfSerie(of serieId:Int, _ completion: @escaping (Result<[Episode], APIError>)->Void)
    func getEpisodesOfSeason(of seasonId:Int, _ completion: @escaping (Result<[Episode], APIError>)->Void)
}

final class EpisodeService:EpisodeServiceProtocol{
    private(set) var targetApi = EpisodeAPI()

    private(set) var respository: APIRepository = Repository()
    
    func getEpisodesOfSerie(of serieId:Int, _ completion: @escaping (Result<[Episode], APIError>)->Void) {
        let endPoint = targetApi(.episodes(serieId))
        fetchRemote(on: endPoint, source: [Episode].self, completion)
    }
    func getEpisodesOfSeason(of seasonId:Int, _ completion: @escaping (Result<[Episode], APIError>)->Void) {
        let endPoint = targetApi(.episodesBySeason(seasonId))
        fetchRemote(on: endPoint, source: [Episode].self, completion)
    }
}
