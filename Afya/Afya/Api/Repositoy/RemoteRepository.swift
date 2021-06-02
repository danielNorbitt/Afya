//
//  RemoteRepository.swift
//  Afya
//
//  Created by Daniel Oliveira on 02/06/21.
//

import Foundation

protocol RemoteService:ServicesProtocol{
    func fetchRemote<T: Decodable>(on target: TargetProtocol, source: T.Type, _ completion:  @escaping (Result<T, APIError>)->())
}
extension RemoteService{
    func fetchRemote<T: Decodable>(on target: TargetProtocol, source: T.Type, _ completion:  @escaping (Result<T, APIError>)->()){
        respository.request(target, source) { result, _ in
            switch result {
            case .success(let object):
                completion(.success(object))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
