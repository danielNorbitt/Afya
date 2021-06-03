//
//  Service.swift
//  Afya
//
//  Created by Daniel Oliveira on 02/06/21.
//

import Foundation
import Alamofire

protocol APIRepository {
    
    func request<T: Decodable>(_ target: TargetProtocol,
                               _ responseModel: T.Type,
                               _ completion: ((Swift.Result<T, APIError>, HTTPURLResponse?) -> Void)?)
    func responseDefaultErrorHandler(error: Error?, data: Data?) -> APIError?
}

final class Repository:APIRepository{
    func request<T>(_ target: TargetProtocol, _ responseModel: T.Type, _ completion: ((Result<T, APIError>, HTTPURLResponse?) -> Void)?) where T : Decodable {
        AF.request(target.pathString(), method: methodAlamofire(target.method), parameters: target.paramenters)
            .validate()
            .responseJSON { (response) in
                if let error = self.responseDefaultErrorHandler(error: response.error, data:response.data) {
                    completion?(.failure(error),response.response)
                    return
                }
                do{
                    guard let data = response.data else { throw APIError.noContent }
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion?(.success(object), response.response)
                } catch {
                    let error = error is DecodingError ? APIError.serial(error as! DecodingError) : APIError.generic(error)
                    completion?(.failure(error), response.response)
                }
            }
    }
    
    func responseDefaultErrorHandler(error: Error?, data: Data?) -> APIError? {
        guard let data = data else { return .noContent }
        
        guard let error = error else { return nil }
        
        if let err = error as? URLError {
            return .connection(err)
        }else {
            if let apiError = try? JSONDecoder().decode(ErrorAPI.self, from: data) { return .application(apiError) }
             if let err = error as? AFError {
                if err.isResponseSerializationError {
                    return .serial(DecodingError.dataCorrupted(DecodingError.Context(codingPath: [],
                                                                                     debugDescription: err.localizedDescription)))
                }
            }
            return .server(error)
        }
    }
    
    private func methodAlamofire(_ method: APIMethod) -> HTTPMethod{
        switch method {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
}


