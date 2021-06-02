// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

// MARK: - SerieElement
struct Serie: Codable {
    let id: Int?
    let name: String?
    let language: String?
    let genres: [String]?
    let status: String?
    let premiered: String?
    let officialSite: String?
    let schedule: Schedule?
    let rating: Rating?
    let network, webChannel: Network?
    let image: Image?
    let summary: String?
    let embedded: Embedded?

    enum CodingKeys: String, CodingKey {
        case id, name, language, genres, status, premiered, officialSite, schedule, rating, network, webChannel, image, summary
        case embedded = "_embedded"
    }
}
