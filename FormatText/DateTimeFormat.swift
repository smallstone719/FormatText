//
//  DateTimeFormat.swift
//  FormatText
//
//  Created by Thach Nguyen Trong on 5/21/24.
//

import SwiftUI

struct DateTimeFormat: View {
    var body: some View {
        NavigationStack {
            Form {
                
                Section("None Format") {
                    Text("\(Date.now)")
                }.textCase(.none)
                
                Section("format: .dateTime.") {
                    ResultFormat(title: "format: .dateTime.day().month().year()") {
                        Text(Date.now,format: .dateTime.day().month().year())
                    }
                    
                    ResultFormat(title: "format: .dateTime.day().year().month()") {
                        Text(Date.now, format: .dateTime.day().year().month())
                    }
                    ResultFormat(title: "format: .dateTime.day().month()") {
                        Text(Date.now, format: .dateTime.day().month())
                    }
                    ResultFormat(title: "format: .dateTime.year().month()") {
                        Text(Date.now, format: .dateTime.year().month())
                    }
                    ResultFormat(title: "format: .dateTime.day().year()") {
                        Text(Date.now, format: .dateTime.day().year())
                    }
                }.textCase(.none)
                
                Section("formatted(date: ., time: .)") {
                    ResultFormat(title: ".formatted(date: .complete, time: .omitted)") {
                        Text(Date.now.formatted(date: .complete, time: .omitted))
                    }
                    
                    ResultFormat(title: ".formatted(date: .long, time: .omitted)") {
                        Text(Date.now.formatted(date: .long, time: .omitted))
                    }
                    ResultFormat(title: ".formatted(date: .abbreviated, time: .omitted)") {
                        Text(Date.now.formatted(date: .abbreviated, time: .omitted))
                    }
                    
                    ResultFormat(title: ".formatted(date: .numeric, time: .omitted)") {
                        Text(Date.now.formatted(date: .numeric, time: .omitted))
                    }
                    
                    ResultFormat(title: ".formatted(date: .omitted, time: .omitted)") {
                        Text(Date.now.formatted(date: .omitted, time: .complete))
                    }
                    ResultFormat(title: ".formatted(date: .omitted, time: .standard)") {
                        Text(Date.now.formatted(date: .omitted, time: .standard))
                    }
                    
                    ResultFormat(title: ".formatted(date: .omitted, time: .shortened)") {
                        Text(Date.now.formatted(date: .omitted, time: .shortened))
                    }
                    
                }.textCase(.none)
                
                Section("formatted(.dateTime.") {
                    ResultFormat(title: ".formatted(.dateTime.dayOfYear())") {
                        Text(Date.now.formatted(.dateTime.dayOfYear()))
                    }
                    ResultFormat(title: ".formatted(.dateTime.era())") {
                        Text(Date.now.formatted(.dateTime.era()))
                    }
                    ResultFormat(title: ".formatted(.dateTime.quarter())") {
                        Text(Date.now.formatted(.dateTime.quarter()))
                    }
                    ResultFormat(title: ".formatted(.dateTime.week())") {
                        Text(Date.now.formatted(.dateTime.week()))
                    }
                    ResultFormat(title: ".formatted(.dateTime.weekday())") {
                        Text(Date.now.formatted(.dateTime.weekday()))
                    }
                    ResultFormat(title: ".formatted(.dateTime.year(.twoDigits))") {
                        Text(Date.now.formatted(.dateTime.year(.twoDigits)))
                    }
                    ResultFormat(title: ".formatted(.dateTime.year(.twoDigits))") {
                        Text(Date.now.formatted(.dateTime.hour(.twoDigits(amPM: .wide))))
                    }
                }.textCase(.none)
                
            }
            .navigationTitle("DateTime Format")
        }
    }
}

#Preview {
    DateTimeFormat()
}
