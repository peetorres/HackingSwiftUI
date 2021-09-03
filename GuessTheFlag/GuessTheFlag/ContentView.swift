//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Usemobile on 02/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France",
                                    "Germany", "Ireland",
                                    "Italy", "Nigeria",
                                    "Poland", "Russia",
                                     "Spain", "UK", "US"]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.blue, .black]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }.foregroundColor(.white)
                
                ForEach(0..<3) { number in
                    Button(action: {
                        flagTapped(number)
                    }, label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    })
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore, content: {
            Alert(title: Text(scoreTitle),
                  message: Text("Your score is ???"),
                  dismissButton: .default(Text("Continue")) {
                    askQuestion()
                  })
        })
        
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
