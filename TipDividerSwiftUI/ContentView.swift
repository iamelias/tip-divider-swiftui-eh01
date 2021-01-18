//
//  ContentView.swift
//  TipDividerSwiftUI
//
//  Created by Elias Hall on 1/17/21.
//

import SwiftUI

struct ContentView: View {
    var percentage: [Double] = [1.0, 0.10, 0.15, 0.20, 0.25]
    @State var selectedPercentage: Int = 0
    @State var textName = ""
     var numPeopleLabel: Int = 1
    @State var stepValue: Int = 0
    var body: some View {
        VStack {
            VStack {
            Text("TipDivider")
                .fontWeight(.heavy)
                .padding()
            }
            Spacer()
            VStack {
            Text("$0.00")
                .font(.system(size: 33))
                .fontWeight(.heavy)
            Text("Tip: 0.00/person")
                .fontWeight(.bold)
            Picker(selection: $selectedPercentage, label: Text(""), content: {
                Text("None").tag(1)
                Text("10%").tag(2)
                Text("15%").tag(3)
                Text("20%").tag(4)
                Text("25%").tag(5)
            }).pickerStyle(SegmentedPickerStyle())
                .padding()
            TextField("50", text: $textName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Number of People")
                .bold()
            Text("\(numPeopleLabel)")
                .bold()
            Stepper("", value: $stepValue).body.frame(width: 100, height: 100, alignment: .center)
            Button(action: {}, label: {
                Text("Calculate")
                    .fontWeight(.bold)
                    .accentColor(Color.black)
                    .padding()
                    .background(Color.yellow)
                    .cornerRadius(10.0)
                    .shadow(color: .black, radius: 1.0, x: 0.0, y: 2.0)
            })
                }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11 Pro")
    }
}
