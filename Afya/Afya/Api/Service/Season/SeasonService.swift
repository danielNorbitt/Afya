//
//  SeasonService.swift
//  Afya
//
//  Created by Daniel Oliveira on 02/06/21.
//

import Foundation

protocol SeasonServiceProtocol:RemoteService{
    func getSeasonsOfSerie(of serieId:Int, _ completion: @escaping (Result<[Season], APIError>)->Void)
}

final class SeasonService:SeasonServiceProtocol{
    
    private(set) var targetApi = SeasonAPI()
    
    private(set) var respository: APIRepository = Repository()
    
    func getSeasonsOfSerie(of serieId: Int, _ completion: @escaping (Result<[Season], APIError>) -> Void) {
        let endpoint = targetApi(.seasons(serieId))
        self.fetchRemote(on: endpoint, source: [Season].self, completion)
    }
    
}
