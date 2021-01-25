//
//  ContentView.swift
//  TipDividerSwiftUI
//
//  Created by Elias Hall on 1/17/21.
//

import SwiftUI

struct ContentView: View {
    //****Variables**********
    @State var selectedPercentage: Int = 0 //selected segment on segmented picker
    @State var totalString = "$0.00"
    @State var txtFieldString = "0.0" //input changes
    @State var stepValue: Int = 1 //input changes
    @State var tipPerPersonString = "Tip: $0.00/person"
    @State var numPeopleStepLbl = "1"
    @State var vModel: CalcViewModel?
    var numPeopleLabel: Double {
        return Double(stepValue)
    }
    var perc: [Int: Double] = [1:1.0, 2:0.10, 3:0.15,4:0.20,5:0.25]

    
    //*******Methods*********
    
    func createCalcModels() -> Calculator { //creating model instance
        let calculate: Calculator = Calculator(totalAmount: Double(txtFieldString) ?? 0.0, numberOfPeople: numPeopleLabel, tipPercentage: perc[selectedPercentage] ?? 1.0)
        
        return calculate
    }
    
    func createCalcViewMdl(calculator: Calculator) { //creating view model instance
        vModel = CalcViewModel(calc: calculator)
    }
    
    func setView() { //changing view
        totalString = vModel?.totalAmount ?? "$0.00"
        tipPerPersonString = vModel?.tipPerPerson ?? "0.00"
    }
    
    //*********UI****************
    var body: some View {
        VStack {
            VStack {
                Text("TipDivider")
                    .fontWeight(.heavy)
                    .padding()
            }
            Spacer()
            VStack {
                VStack {
                    Text("\(vModel?.totalAmount ?? "0.00")")
                        .font(.system(size: 33))
                        .fontWeight(.heavy)
                    Text("\(vModel?.tipPerPerson ?? "Tip: 0.00/Person")")
                        .fontWeight(.bold)
                    Picker(selection: $selectedPercentage, label: Text(""), content: {
                        Text("None").tag(1)
                        Text("10%").tag(2)
                        Text("15%").tag(3)
                        Text("20%").tag(4)
                        Text("25%").tag(5)
                    }).pickerStyle(SegmentedPickerStyle())
                    .padding()
                    TextField("50", text: $txtFieldString)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Number of People")
                        .bold()
                    Text("\(stepValue)")
                        .bold()
                    Stepper("", value: $stepValue).body.frame(width: 100, height: 100, alignment: .center)
                    Button(action: {
                        let cal = createCalcModels()
                        createCalcViewMdl(calculator: cal )
                        setView()
                    }, label: {
                        Text("Calculate")
                            .fontWeight(.bold)
                            .accentColor(Color.black)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10.0)
                            .shadow(color: .black, radius: 1.0, x: 0.0, y: 2.0)
                    })
                }
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
