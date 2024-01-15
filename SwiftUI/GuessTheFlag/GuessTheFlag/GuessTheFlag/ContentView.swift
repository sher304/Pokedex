//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Шермат Эшеров on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    @State private var countries = ["Estonia", "France", "Germany",
                                    "Poland", "Ukraine", "US", "Italy",
                                    "Spain", "UK", "Nigeria", "Monako", "Ireland"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showScore = false
    @State private var scoreTitle = ""
    
    @State private var scoreAmount = 0
    @State private var counter = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops:
                            [.init(color: .orange, location: 0.3),
                             .init(color: .indigo, location: 0.3),
                            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .font(.largeTitle)
                Spacer()
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.black)
                            .fontWeight(.light)
                            .font(.headline)
                        Text("\(countries[correctAnswer])")
                            .foregroundColor(.black)
                            .fontWeight(.black)
                            .font(.largeTitle)
                    }
                    
                    ForEach(0..<3) { index in
                        Button {
                            if index != correctAnswer {
                                askQuestion()
                            } else {
                                called(index: index)
                            }
                        } label: {
                            Image(countries[index])
                                .shadow(radius: 9)
                        }
                    }
                }
                .alert(scoreTitle, isPresented: $showScore) {
                    Button("No", role: .destructive) {
                        continueGame(exit: true)
                    }
                    Button("Yes", role: .cancel) {
                        continueGame(exit: false)
                    }
                    
                } message: {
                    Text("""
                        Your score is \(scoreAmount)
                        Do you want to countinue?
                        """)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .cornerRadius(20)
                
                Spacer()
                Spacer()
                
                Text("Score: \(scoreAmount)")
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .font(.largeTitle)
                Spacer()
            }
            .padding(20)
        }
    }
    
    private func called(index: Int) {
        counter += 1
        if index == correctAnswer {
            scoreTitle = "Correct!"
            scoreAmount += 1
            
        } else {
            scoreTitle = """
                            Incorrect!
                            This is flag of: \(countries[correctAnswer])
                            """
            scoreAmount -= 1
        }
        
        askQuestion()
        
        if counter == 8 {
            showScore = true
        }
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func continueGame(exit: Bool) {
        if exit {
            showScore = false
            counter = 0
            scoreAmount = 0
        } else {
            showScore = false
            counter = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
