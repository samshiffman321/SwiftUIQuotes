//
//  QuoteLoader.swift
//  Quotes
//
//  Created by Samuel Shiffman on 10/12/19.
//  Copyright © 2019 Samuel Shiffman. All rights reserved.
//

import Foundation

public protocol QuoteLoader {
    func getRandomQuote(completion: @escaping (Result<Quote, Error>) -> Void)
}

public enum QuoteLoaderError: Error {
    case anyError
}

public protocol QuoteLoaderFactory {
    func makeQuoteLoader(isProgramming: Bool) -> QuoteLoader
}

public extension QuoteLoaderFactory {
    func makeQuoteLoader(isProgramming: Bool) -> QuoteLoader {
        if isProgramming {
            return ProgrammingQuoteApiClient()
        }
        return QuoteGardenClient()
    }
}

public class QuoteFactory: QuoteLoaderFactory { }
