//
//  ContentView.swift
//  FormatText
//
//  Created by Thach Nguyen Trong on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ArrayFormat()
                .tabItem {
                    Label("Array", systemImage: "ellipsis.curlybraces")
                }
            
            MeasurementFormat()
                .tabItem {
                    Label("Measurement", systemImage: "lines.measurement.horizontal")
                }
            CurrencyFormat()
                .tabItem {
                    Label("Currency", systemImage: "dollarsign")
                }
            NumberFormat()
                .tabItem {
                    Label("Currency", systemImage: "textformat.123")
                }
            DateTimeFormat()
                .tabItem {
                    Label("Currency", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    ContentView()
}


