//
//  ProgrammingQuote.swift
//  Quotes
//
//  Created by Samuel Shiffman on 10/12/19.
//  Copyright © 2019 Samuel Shiffman. All rights reserved.
//

import Foundation

struct ProgrammingQuote: Decodable, Quote {
    let quote: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case quote = "en"
        case author
    }
}
