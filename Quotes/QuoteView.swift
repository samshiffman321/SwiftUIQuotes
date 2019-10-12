//
//  QuoteView.swift
//  Quotes
//
//  Created by Samuel Shiffman on 10/11/19.
//  Copyright © 2019 Samuel Shiffman. All rights reserved.
//

import SwiftUI

struct QuoteView: View {
    var quotationMark: some View {
        Text("\"")
        .font(.system(size: 45))
    }
    var body: some View {
        VStack {
            Text(verbatim: "Hello World this is a long quote that lasts multiple lines. it has two sentences and wraps around multiple lines without truncating at all.")
                //current bug in swift UI with line limit nil or 0
                .lineLimit(20)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
                .overlay(quotationMark, alignment: .topLeading)
                .overlay(quotationMark, alignment: .bottomTrailing)
            Text(" - By Author")
            Spacer()
            Button("New Quote",
                   action: {
                    //TODO: get a new quote
            })
            
        }
    
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
