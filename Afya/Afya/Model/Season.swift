// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

// MARK: - Season
struct Season: Codable, Hashable{
    
    let identifier:UUID = UUID()
    let id: Int?
    let number: Int?
    let name: String?
    let episodeOrder: Int?
    let premiereDate, endDate: String?
    let image: Image?
    let summary: String?

    enum CodingKeys: String, CodingKey {
        case id, number, name, episodeOrder, premiereDate, endDate, image, summary
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
