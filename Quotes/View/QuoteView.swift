//
//  QuoteView.swift
//  Quotes
//
//  Created by Samuel Shiffman on 10/11/19.
//  Copyright © 2019 Samuel Shiffman. All rights reserved.
//

import SwiftUI

struct QuoteView: View {
    @ObservedObject var viewModel: QuoteViewModel
    var quotationMark: some View {
        Text(",,")
        .font(.system(size: 45))
    }
    var body: some View {
        VStack {
            Text(viewModel.quote)
                //current bug in swift UI with line limit nil or 0
                //setting line limit to 20 so that quote isn't truncated
                .lineLimit(20)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
                .overlay(quotationMark, alignment: .topLeading)
                .overlay(quotationMark, alignment: .bottomTrailing)
            Text(viewModel.byLine)
            Spacer()
            Button("New Quote",
                   action: {
                    self.viewModel.loadQuote()
            })
            Toggle("Programming Quotes", isOn: $viewModel.showProgrammingQuotes)
            .padding()
            
        }
    
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var quoteLoader = QuoteGardenClient()
    static var factory = QuoteFactory()
    static var testVM = QuoteViewModel(quote: "I've always loved the experience of working together with other people toward an artistic goal.", author: "Trey Anastasio", quoteLoader: quoteLoader, quoteLoaderFactory: factory)
    static var previews: some View {
        QuoteView(viewModel: testVM)
    }
}