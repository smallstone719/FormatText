//
//  NumberFormat.swift
//  FormatText
//  https://medium.com/@jpmtech/formatting-numbers-in-swiftui-fc5ee2920a59
//  Created by Thach Nguyen Trong on 5/21/24.
//

import SwiftUI

struct NumberFormat: View {
    @State private var number: Double = 12.3456
    @State private var amount = 0.25
    var body: some View {
        NavigationStack {
            Form  {
                Section("Number") {
                    TextField("Number", value: $number, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Set explicit rounding rules to round to the nearest whole number") {
                    ResultFormat(title: "Format: .number.rounded(rule: .down, increment: 0.5)") {
                        Text(number, format: .number.rounded(rule: .down, increment: 0.5))
                    }
                    
                    ResultFormat(title: "Format: .number.rounded(rule: .down, increment: 1.0)") {
                        Text(number, format: .number.rounded(rule: .down, increment: 1.0))
                    }
                    
                    ResultFormat(title: "Format: .number.rounded(rule: .up, increment: 0.5)") {
                        Text(number, format: .number.rounded(rule: .up, increment: 0.5))
                    }
                    
                    ResultFormat(title: "Format: .number.rounded(rule: .up, increment: 1.0)") {
                        Text(number, format: .number.rounded(rule: .up, increment: 1.0))
                    }
                }
                .textCase(.none)
                
                Section("Uses the default rounding method and rounds to the nearest X") {
                    ResultFormat(title: "Format: .number.rounded(increment: 10.0)") {
                        Text(number, format: .number.rounded(increment: 10.0))
                    }
                    
                    ResultFormat(title: "Format: .number.rounded(increment: 1.0)") {
                        Text(number, format: .number.rounded(increment: 1.0))
                    }
                    ResultFormat(title: "Format: .number.rounded(increment: 0.5)") {
                        Text(number, format: .number.rounded(increment: 0.5))
                    }
                    ResultFormat(title: "Format: .number.rounded(increment: 0.1)") {
                        Text(number, format: .number.rounded(increment: 0.1))
                    }
                    
                    ResultFormat(title: "Format: .number.rounded(increment: 0.01)") {
                        Text(number, format: .number.rounded(increment: 0.01))
                    }
                    
                    ResultFormat(title: "Format: .number.rounded(increment: 0.001)") {
                        Text(number, format: .number.rounded(increment: 0.001))
                    }
                    
                }.textCase(.none)
                
                Section("using precision returns a similar result, but with a slightly easier to reason about API") {
                    Text(number, format: .number.precision(.fractionLength(0)))
                    Text(number, format: .number.precision(.fractionLength(1)))
                    Text(number, format: .number.precision(.fractionLength(2)))
                }.textCase(.none)
                
                Section("Choosing when to show the decimal") {
                    Text(number, format: .number.decimalSeparator(strategy: .always))
                    Text(number, format: .number.sign(strategy: .always(includingZero: true)))
                    Text(0, format: .number.sign(strategy: .always(includingZero: true)))
                    Text(0, format: .number.sign(strategy: .always(includingZero: false)))
                } .textCase(.none)
                
                Section("Choosing when to show or hide the seperator") {
                    Text(123456.789, format: .number.grouping(.never)) // 123456.789
                    Text(123456.789, format: .number.grouping(.automatic)) // 123,456.789
                } .textCase(.none)
                Section("Choosing a custom notation") {
                    Text(123456.789, format: .number.notation(.compactName)) // 123K
                                Text(123456.789, format: .number.notation(.scientific)) // 1.234568E5
                    Text(123456789, format: .number.notation(.compactName).precision(.significantDigits(2))) // 120M
                } .textCase(.none)
                
                Section {
                    VStack(alignment: .leading) {
                        Text(amount, format: .percent)
                        // Accepting a number as input to a text field
                        TextField("Amount", value: $amount, format: .percent)
                    }
                }
            }
            .navigationTitle("Numbers")
        }
    }
}

#Preview {
    NumberFormat()
}




/**
 func printNumbersAsFormattedStrings() {
     print("")
     print(12.3456.formatted(.number))
     
     // Set explicit rounding rules to round to the nearest whole number
     print(12.3456.formatted(.number.rounded(rule: .down, increment: 1.0))) // 12
     print(12.3456.formatted(.number.rounded(rule: .up, increment: 1.0))) // 13
     
     // Uses the default rounding method and rounds to the nearest X
     print(12.3456.formatted(.number.rounded(increment: 10.0))) // 10 (ten)
     print(12.3456.formatted(.number.rounded(increment: 1.0))) // 12 (whole number)
     print(12.3456.formatted(.number.rounded(increment: 0.1))) // 12.3 (tenth)
     print(12.3456.formatted(.number.rounded(increment: 0.01))) // 12.35 (hundredeth)
     print(12.3456.formatted(.number.rounded(increment: 0.001))) // 12.346 (thousandth)
     // using precision returns a similar result, but with a slightly easier to reason about API
     print(12.3456.formatted(.number.precision(.fractionLength(0)))) // 12
     print(12.3456.formatted(.number.precision(.fractionLength(1)))) // 12.3
     print(12.3456.formatted(.number.precision(.fractionLength(2)))) // 12.35
     
     // Choosing when to show the decimal
     print(123456.formatted(.number.decimalSeparator(strategy: .always))) // 123,456.
     
     // Choosing when to show a sign to indicate if the number is positive or negative
     print(12.3456.formatted(.number.sign(strategy: .always(includingZero: true)))) // +12.3456
     print(0.formatted(.number.sign(strategy: .always(includingZero: true)))) // +0
     
     // Choosing when to show or hide the seperator
     print(123456.789.formatted(.number.grouping(.never))) // 123456.789
     print(123456.789.formatted(.number.grouping(.automatic))) // 123,456.789
     
     // Choosing a custom notation
     print(123456.789.formatted(.number.notation(.compactName))) // 123K
     print(123456.789.formatted(.number.notation(.scientific))) // 1.234568E5

     // Combining formatters
     print(123456789.formatted(.number.notation(.compactName).precision(.significantDigits(2)))) // 120M
 }
 */
