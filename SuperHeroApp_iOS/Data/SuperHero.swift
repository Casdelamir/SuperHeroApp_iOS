//
//  SuperHero.swift
//  SuperHeroApp_iOS
//
//  Created by Mañanas on 9/9/24.
//

struct SuperHeroSearch: Codable {
    let response: String
    let resultsFor: String
    let results: [SuperHero]
        
        enum CodingKeys: String, CodingKey {
            case response, results
            case resultsFor = "results-for"
        }
}

struct SuperHero: Codable {
    let id: String
    let name: String
    let powerstats: Stats
    let biography: Biography
    let image: Image
}

struct Biography: Codable {
    let fullName: String
    let alterEgos: String
    let aliases: [String]
    let placeOfBirth: String
    let publisher: String
    let alignment: String
    
    enum CodingKeys: String, CodingKey {
        case aliases, publisher, alignment
        case fullName = "full-name"
        case placeOfBirth = "place-of-birth"
        case alterEgos = "alter-egos"
    }
}

struct Stats: Codable {
    let intelligence: String?
    let strength: String?
    let speed: String?
    let durability: String?
    let power: String?
    let combat: String?
}

struct Image: Codable {
    let url: String
}
