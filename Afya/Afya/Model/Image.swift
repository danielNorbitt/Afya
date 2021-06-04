// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//


import Foundation

// MARK: - Image
struct Image: Codable, Hashable{
    let medium, original: String?
    
    var urlUmageMedium:URL? {
        guard let mediumSafe = medium else {return nil}
        return URL(string: mediumSafe)
    }
    
    var urlUmageOriginal:URL? {
        guard let originalSafe = original else {return nil}
        return URL(string: originalSafe)
    }
    
}
