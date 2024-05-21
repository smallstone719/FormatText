//
//  CurrencyFormat.swift
//  FormatText
//
//  Created by Thach Nguyen Trong on 5/21/24.
//

import SwiftUI

struct CurrencyFormat: View {
    @Environment(\.locale) private var locale
    @State var amountModel = AmountModel()
    @State var amount: Decimal = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                /// ISOCurrencyCodes.csv
                /// https://gist.github.com/jacobbubu/1836141
                ///
                Section("Text") {
                    Text(72.3, format: .currency(code: "USD"))
                    Text(72.3, format: .currency(code: "EUR"))
                    Text(72.3, format: .currency(code: "JPY"))
                    
                    Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))

                }
                Section("TextField") {
                    /// Sử dụng Locale current code
                    TextField("Amount", value: $amount, format: .currency(code: locale.currency?.identifier ?? "USD"))
                    /// Sử dụng model để chọn Currency Code
                    TextField("Amount", value: $amountModel.value, format: .currency(code: amountModel.currencyCode))
                }
            }
            .navigationTitle("Currency")
        }
    }
}

#Preview {
    CurrencyFormat()
}

struct AmountModel {
    var value: Decimal = 0
    let currencyCode = "GBP"
}
