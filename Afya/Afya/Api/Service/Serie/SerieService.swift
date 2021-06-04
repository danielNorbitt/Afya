//
//  SerieService.swift
//  Afya
//
//  Created by Daniel Oliveira on 01/06/21.
//

import Foundation

protocol SerieServiceProtocol:RemoteService{
    func getAllSeries(_ completion: @escaping (Result<[Serie], APIError>)->Void)
    func getSeriesByPage(on numberPage:Int, _ completion: @escaping (Result<[Serie], APIError>)->Void)
    func getSerie(serieId:Int, _ completion: @escaping (Result<Serie, APIError>)->Void)
    func getSearcheSeriesByName(by nameSerie:String, _ completion: @escaping (Result<[SearchResult], APIError>)->Void)
}

final class SerieService:SerieServiceProtocol{

    private(set) var targetApi = SerieAPI()

    private(set) var respository: APIRepository = Repository()
    
    func getAllSeries(_ completion: @escaping (Result<[Serie], APIError>) -> Void) {
        let endPoint = targetApi(.series)
        fetchRemote(on: endPoint, source: [Serie].self, completion)
    }
    func getSerie(serieId:Int, _ completion: @escaping (Result<Serie, APIError>)->Void) {
        let endPoint = targetApi(.serie(serieId))
        fetchRemote(on: endPoint, source: Serie.self, completion)
    }
    
    func getSeriesByPage(on numberPage:Int, _ completion: @escaping (Result<[Serie], APIError>)->Void) {
        let endPoint = targetApi(.seriesPage(numberPage))
        fetchRemote(on: endPoint, source: [Serie].self, completion)
    }
    
    func getSearcheSeriesByName(by nameSerie:String, _ completion: @escaping (Result<[SearchResult], APIError>)->Void) {
        let endPoint = targetApi(.searchByName(nameSerie))
        fetchRemote(on: endPoint, source: [SearchResult].self, completion)
    }
}
