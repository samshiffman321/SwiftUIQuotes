//
//  Quote.swift
//  Quotes
//
//  Created by Samuel Shiffman on 10/12/19.
//  Copyright © 2019 Samuel Shiffman. All rights reserved.
//

import Foundation

public protocol Quote {
    var quote: String { get }
    var author: String { get }
}
