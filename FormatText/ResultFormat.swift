//
//  ResultFormat.swift
//  FormatText
//
//  Created by Thach Nguyen Trong on 5/21/24.
//

import SwiftUI

struct ResultFormat<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.footnote)
                .foregroundStyle(Color.primary.opacity(0.7))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            content
        }
    }
}
