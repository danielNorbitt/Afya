//
//  APIClient.swift
//  Afya
//
//  Created by Daniel Oliveira on 01/06/21.
//

import Foundation

enum APIMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol EndPoint { }

protocol TargetProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: APIMethod { get }
    var paramenters: [String:String]? { get }
    func pathString() -> String
}

extension TargetProtocol {
     func pathString() -> String {
        return "\(baseURL)\(path)"
    }
}

final class TargetAPI: TargetProtocol {
    var baseURL: String
    var path: String
    var method: APIMethod = .get
    var paramenters: [String:String]?

    init(baseURL: String? = nil,
         path: String? = nil ,
         paramenters:  [String:String]? = nil,
         header: [String : String]? = nil) {
        self.baseURL = baseURL ?? "https://api.tvmaze.com"
        self.path = path ?? ""
        self.method = .get
        self.paramenters = paramenters
    }
}

protocol APIProtocol {
    associatedtype End: EndPoint
    func run(endpoint: End) -> TargetProtocol
}


protocol ServicesProtocol {
    associatedtype API: APIProtocol
    var targetApi: API { get }
    var respository: APIRepository { get }
}
