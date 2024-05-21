//
//  MeasurementFormat.swift
//  FormatText
//
//  Created by Thach Nguyen Trong on 5/21/24.
//

import SwiftUI

struct MeasurementFormat: View {
    let length = Measurement(value: 225, unit: UnitLength.centimeters)
    var body: some View {
        NavigationStack {
            Form {
                Section("Format: 225cm") {
                    Text(length, format: .measurement(width: .wide))
                    Text(length, format: .measurement(width: .abbreviated))
                    Text(length, format: .measurement(width: .narrow))
                }
                .textCase(.none)
            }
            .navigationTitle("Measurement : ")
        }
    }
}

#Preview {
    ContentView()
}
/**
//                 Or if you’re working with measurements such as distance or weight,
//                 the .measurement() format type will automatically adjust your value for display in the user’s locale.
//                 For example, if you were storing values in centimeters internally but the user had a US locale on their device, iOS will automatically display a value in feet or inches depending on the size of the value.
//                 */
