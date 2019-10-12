//
//  QuoteViewModel.swift
//  Quotes
//
//  Created by Samuel Shiffman on 10/12/19.
//  Copyright © 2019 Samuel Shiffman. All rights reserved.
//

import Foundation

public class QuoteViewModel: ObservableObject {
    @Published var quote: String
    @Published var byLine: String
    var quoteLoader: QuoteLoader
    var quoteLoaderFactory: QuoteLoaderFactory
    private var isProgramming: Bool = false
    var showProgrammingQuotes: Bool {
        get {
            return isProgramming
        }
        set {
            isProgramming = newValue
            quoteLoader = quoteLoaderFactory.makeQuoteLoader(isProgramming: newValue)
            loadQuote()
        }
    }
    
    
    init(quote: String, author: String, quoteLoader: QuoteLoader, quoteLoaderFactory: QuoteLoaderFactory) {
        self.quote = quote
        self.byLine = "- \(author)"
        self.quoteLoader = quoteLoader
        self.quoteLoaderFactory = quoteLoaderFactory
    }
    
    func loadQuote() {
        quoteLoader.getRandomQuote { [weak self] result in
            switch result {
            case .success(let quote):
                DispatchQueue.main.async {
                    let unknown = "Unknown"
                    
                    self?.quote = quote.quote
                    self?.byLine = "- \(quote.author.isEmpty ? unknown : quote.author)"
                }
                
            case .failure:
                DispatchQueue.main.async {
                    self?.quote = "Oops! It appears there was an error loading a quote!"
                    self?.byLine = "Sorry!"
                }
            }
        }
    }
}
