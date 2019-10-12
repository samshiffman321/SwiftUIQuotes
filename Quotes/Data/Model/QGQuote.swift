//
// Quote Garden Quote Model
//  QGQuote.swift
//  Quotes
//
//  Created by Samuel Shiffman on 10/12/19.
//  Copyright © 2019 Samuel Shiffman. All rights reserved.
//

import Foundation

struct QGQuote: Decodable, Quote {
    let quote: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case quote = "quoteText"
        case author = "quoteAuthor"
    }
    
}
