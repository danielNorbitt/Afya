// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let episode = try? newJSONDecoder().decode(Episode.self, from: jsonData)

import Foundation

// MARK: - Episode
struct Episode: Codable, Hashable{
    
    let identifier:UUID = UUID()
    let id: Int?
    let name: String?
    let season, number: Int?
    let type: String?
    let airdate: String?
    let airtime: String?
    let airstamp: String?
    let runtime: Int?
    let image: Image?
    let summary: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, season, number, type, airdate, airtime, airstamp, runtime, image, summary
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

extension Episode: Equatable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.id == rhs.id
    }
}
