// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let errorAPI = try? newJSONDecoder().decode(ErrorAPI.self, from: jsonData)

import Foundation

// MARK: - ErrorAPI
struct ErrorAPI: Codable {
    let name, message: String?
    let code, status: Int?

}

enum APIError:Error {
    case application(ErrorAPI)      // Application Error when body match PagVendasApiError Content.
    case connection(URLError)       // Connectivity error, iOS default hange noConnection, timeout, etc ...
    case server(Error)              // Server side error, usually 500 but fit when PagVendasAPIError not decode too.
    case serial(DecodingError)      // Serial error, when status 200 ..< 300 and content not decode.
    case noContent                  // No Content, usually when response has no data body.
    case generic(Error)             // default error
}
