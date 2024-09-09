//
//  DataProvider.swift
//  SuperHeroApp_iOS
//
//  Created by Mañanas on 9/9/24.
//

import Foundation

class DataProvider {
    
    static func findSuperHeroesByName(_ name: String, withResult: @escaping ([SuperHero]) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)search/\(name)") else {
            print("URL not valid")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Handle the error
                print("Error: \(error.localizedDescription)")
                return
            } else if let data = data {
                // Process the data
                let result = try! JSONDecoder().decode(SuperHeroSearch.self, from: data)
                withResult(result.results)
            }
        }
        task.resume()
    }

    static func findSuperHeroesByName(_ name: String) async throws -> [SuperHero] {
        guard let url = URL(string: "\(Constants.BASE_URL)search/\(name)") else {
            print("URL not valid")
            return []
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(SuperHeroSearch.self, from: data)
        return result.results
    }
}

