//
//  ContentView.swift
//  ChallangeApp
//
//  Created by Шермат Эшеров on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    private let units: [DistanceUnit] = [.Kilometer, .Meter,
                                         .Yards, .Miles, .Feet]
    
    @State private var defaultUnit = DistanceUnit.Meter
    @State private var selectedUnit = DistanceUnit.Kilometer
    
    @State private var enteredValue: Double = 0
    
    private var resultOfConvert: Double {
        switch selectedUnit {
        case .Kilometer:
            switch defaultUnit {
            case .Kilometer:
                return enteredValue * 1
            case .Meter:
                return enteredValue * 1000.0000319999695648
            case .Feet:
                return enteredValue * 3280.8399999999001011
            case .Yards:
                return enteredValue * 1093.6133333333000337
            case .Miles:
                return enteredValue / 1.609
            }
        case .Meter:
            switch defaultUnit {
            case .Kilometer:
                return enteredValue / 1000
            case .Meter:
                return enteredValue / 1
            case .Feet:
                return enteredValue / 3.28084
            case .Yards:
                return enteredValue / 1.0936133333333
            case .Miles:
                return enteredValue / 0.00062137121212119323429
            }
        case .Feet:
            switch defaultUnit {
            case .Kilometer:
                return enteredValue / 0.00030480000975359071219
            case .Meter:
                return enteredValue / 0.30480000975359072823
            case .Feet:
                return enteredValue / 1
            case .Yards:
                return enteredValue / 0.33333334399998987285
            case .Miles:
                return enteredValue / 0.00018939394545453968471
            }
        case .Yards:
            switch defaultUnit {
            case .Kilometer:
                return enteredValue / 0.00091440002926077208235
            case .Meter:
                return enteredValue / 0.91440002926077212919
            case .Feet:
                return enteredValue / 1
            case .Yards:
                return enteredValue / 1.0936133333333000195
            case .Miles:
                return enteredValue / 0.00062137121212119323429
            }
        case .Miles:
            switch defaultUnit {
            case .Kilometer:
                return enteredValue * 1.6093440514989589829
            case .Meter:
                return enteredValue * 1609.3440514989590611
            case .Feet:
                return enteredValue * 5280.0001689598393568
            case .Yards:
                return enteredValue * 1760.0000563199464523
            case .Miles:
                return enteredValue * 1
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select unit") {
                    Picker("Select Unit", selection: $defaultUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Select unit to convert") {
                    Picker("Select Unit", selection: $selectedUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Enter a value \(selectedUnit.rawValue)") {
                    TextField("Enter a value", value: $enteredValue, format: .currency(code: ""))
                }
                
                Section("Result") {
                    Text("\(defaultUnit.rawValue): \(resultOfConvert.description)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum DistanceUnit: String {
    case Kilometer = "Kilometer"
    case Meter = "Meter"
    case Feet = "Feet"
    case Yards = "Yards"
    case Miles = "Miles"
}
