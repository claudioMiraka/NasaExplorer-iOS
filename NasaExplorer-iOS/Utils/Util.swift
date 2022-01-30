//
//  Util.swift
//  NasaExplorer-iOS
//
//  Created by Claudio Miraka on 1/24/22.
//

import Foundation

let apiKey = "DEMO_KEY"

func fetchData<T: Decodable>(_ urlString: String) async -> T? {
    
    do {
        print("Request to: \(urlString)")
        let (data, response) = try await URLSession.shared.data(from: URL(string:urlString)!)
        
        guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(response)")
          return nil
        }
        
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        }catch{
            fatalError("Couldn't parse \(data) \n \(error)")
        }
    } catch {
        print("Error \(error.localizedDescription)")
    }
    return nil
}

