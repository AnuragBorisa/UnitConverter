    //
    //  ContentView.swift
    //  UnitConverter
    //
    //  Created by Anurag on 16/12/24.
    //

    import SwiftUI

    struct ContentView: View {
        @State private var inputValue : Double = 0.0 ;
        @State private var inputUnit : String = "meters" ;
        @State private var outputUnit : String = "meters" ;
        let unitss : [String] = ["meters","kilometers","feet","yard","miles"]
        let toMeters: [String: Double] = [
              "meters": 1.0,
              "kilometers": 1000.0,
              "feet": 0.3048,
              "yard": 0.9144,
              "miles": 1609.34
          ]
          
          // Conversion factors from meters to target units
          let fromMeters: [String: Double] = [
              "meters": 1.0,
              "kilometers": 0.001,
              "feet": 3.28084,
              "yard": 1.09361,
              "miles": 0.000621371
          ]
        var result: Double {
               let inputInMeters = inputValue * (toMeters[inputUnit] ?? 1.0)
               return inputInMeters * (fromMeters[outputUnit] ?? 1.0)
           }
        var body: some View {
            NavigationStack{
                Form{
                    Section{
                        Picker("Select the Input unit",selection: $inputUnit){
                            ForEach(unitss,id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                        Text("Selected Input Unit : \(inputUnit)")
                    }
                    Section{
                        Picker("Select the Output unit",selection: $outputUnit){
                            ForEach(unitss,id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                        Text("Selected Output Unit : \(outputUnit)")
                    }
                    Section{
                        TextField("Value",value:$inputValue,format:.number).keyboardType(.decimalPad)
                    }
                    Section {
                                      Text("Result after Conversion: \(result, specifier: "%.4f") \(outputUnit)")
                                  }
                }.navigationTitle("Unit Converter")
            }
        }
    }

    #Preview {
        ContentView()
    }
