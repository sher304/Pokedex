//
//  ContentView.swift
//  WeSplit
//
//  Created by Шермат Эшеров on 5/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    @FocusState private var isDone: Bool

    private let percentage = [20, 40, 10, 15, 0, 50]

    private var totalPerPeson: Double {
        let tipAmount = checkAmount / 100 * Double(tipPercentage)
        let totalAmount = checkAmount + tipAmount
        return totalAmount / Double(numberOfPeople + 2)
    }
    
    private var totalAmount: Double {
        let tipAmount = checkAmount / 100 * Double(tipPercentage)
        return checkAmount + tipAmount
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount: ", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "KGZ"))
                        .keyboardType(.decimalPad)
                        .focused($isDone)

                    Picker("Select People", selection: $numberOfPeople) {
                        ForEach(2..<11) {
                            Text("People: \($0)")
                        }
                    }
                }

                Section("Tip percetage?") {
                    Picker("Tip percetage: ", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }

                Section("Amount per person") {
                    Text(totalPerPeson, format: .currency(code: Locale.current.currency?.identifier ?? "KGZ"))
                }
                
                Section("Total Amount") {
                    Text(totalAmount, format: .currency(code: Locale.current.identifier ))
                }
            }
            .navigationTitle("Currency Converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if isDone {
                    Button("Done") {
                        isDone = false
                    }
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
