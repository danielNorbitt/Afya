// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

// MARK: - SerieElement
struct Serie: Codable, Hashable {
    
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
    
    var formattedSumary: NSAttributedString? {
        guard let summarySafe = summary else {return nil}
        let data = Data(summarySafe.utf8)
        return try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
    }

    enum CodingKeys: String, CodingKey {
        case id, name, language, genres, status, premiered, officialSite, schedule, rating, network, webChannel, image, summary
        case embedded = "_embedded"
    }
}

extension Serie: Equatable {
    static func == (lhs: Serie, rhs: Serie) -> Bool {
        return lhs.id == rhs.id
    }
}
