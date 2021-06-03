//
//  SeasonAPI.swift
//  Afya
//
//  Created by Daniel Oliveira on 02/06/21.
//

import Foundation

@dynamicCallable
struct SeasonAPI:APIProtocol {

    enum endpoint:EndPoint {
        case seasons(Int)
//        case
    }
    
    func dynamicallyCall(withArguments args: [SeasonAPI.endpoint]) -> TargetProtocol {
        return self.run(endpoint: args.first!)
    }
    
    func run(endpoint: SeasonAPI.endpoint) -> TargetProtocol {
        let api = TargetAPI()
        switch endpoint {
        case .seasons(_):
            api.path = ""
        }
        return api
    }
}
