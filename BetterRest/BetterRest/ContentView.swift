//
//  ContentView.swift
//  BetterRest
//
//  Created by Usemobile on 03/09/21.
//

import SwiftUI

struct SleepCalculator {
    
}

struct ContentView: View {
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    @State private var coffeeAmout = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Desider amount of sleep")
                DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
                    .labelsHidden()
                    .frame(width: 300, height: 50, alignment: .center)
            }
        }
        .navigationBarTitle("Better rest")
        .navigationBarItems(leading: Button(action: calculateBedtime) {
                                Text("Button") }
        )
    }
    
    func calculateBedtime() {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
