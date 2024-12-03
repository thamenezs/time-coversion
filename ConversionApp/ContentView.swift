//
//  ContentView.swift
//  ConversionApp
//
//  Created by Thais Souza on 03/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input = "Seconds"
    @State private var output = "Minutes"
    @State private var inputNumber = 0.0
    let conversionOptions = ["Seconds", "Minutes", "Hours", "Days"]
    
    var conversion: Double {
        var inputInSeconds = 0.0
        var conversed = 0.0
        
        switch input {
        case "Minutes":
            inputInSeconds = inputNumber * 60
            
        case "Hours":
            inputInSeconds = inputNumber * 3600
            
        case "Days":
            inputInSeconds = inputNumber * 86400
            
        case "Seconds":
            inputInSeconds = inputNumber
            
        default: break
            
        }
        
        if output == "Minutes" {
            conversed = inputInSeconds / 60
        } else if output == "Hours" {
            conversed = inputInSeconds / 3600
        } else if output == "Days" {
            conversed = inputInSeconds / 86400
        } else {
            conversed = inputInSeconds
        }
        
        return conversed
    }
    var body: some View {
        NavigationStack{
            Form {
                Section ("Transform"){
                    Picker("To be conversed", selection: $input) {
                        ForEach(conversionOptions, id: \.self){
                            Text($0)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section ("into"){
                    Picker("Into", selection: $output) {
                        ForEach(conversionOptions, id: \.self){
                            Text($0)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                }
                
                Section{
                    TextField("To be conversed", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section{
                    Text(conversion, format: .number)
                }
                
                .navigationTitle("Conversion App")
            }
        }
    }
}

#Preview {
    ContentView()
}
