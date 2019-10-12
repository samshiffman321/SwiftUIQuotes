//
//  QuoteGardenClient.swift
//  Quotes
//
//  Created by Samuel Shiffman on 10/12/19.
//  Copyright © 2019 Samuel Shiffman. All rights reserved.
//

import Foundation

public class QuoteGardenClient: QuoteLoader {
    public func getRandomQuote(completion: @escaping (Result<Quote, Error>) -> Void) {
        guard let url = URL(string: "https://quote-garden.herokuapp.com/quotes/random") else {
            completion(.failure(QuoteLoaderError.anyError))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                //sample app - don't care about error - report any error
                completion(.failure(QuoteLoaderError.anyError))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let quote = try decoder.decode(QGQuote.self, from: data)
                    completion(.success(quote))
                } catch {
                    //sample app - don't care about error - report any error
                    completion(.failure(QuoteLoaderError.anyError))
                }
                
            }
        }
        
        task.resume()
    }
    
    
}
