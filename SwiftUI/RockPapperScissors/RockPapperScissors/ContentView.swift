//
//  ContentView.swift
//  RockPapperScissors
//
//  Created by Шермат Эшеров on 10/1/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    private var data = ["Rock", "Papper", "Scissor"]
    private var winOrLose = ["Win", "Lose"]
    
    @State private var dataChosed: Int = 0
    @State private var detecterOfWin: Bool = true
    @State private var pointCounter = 0
    @State private var counterOfGame = 0
    @State private var showAlertMessage = false
    @State private var selectedIndex = 0
    
    var body: some View {
//        ZStack {
//            LinearGradient(colors: [.indigo, .white], startPoint: .bottomTrailing, endPoint: .topLeading)
//                .ignoresSafeArea()
//
//            VStack {
//                HStack(spacing: 15) {
//                    textRounded(text: "Rock")
//                    textRounded(text: "Papper")
//                    textRounded(text: "Scissor")
//                }
//                VStack() {
//                    Text("Choose correct one")
//                        .padding(12)
//                        .background(.blue)
//                        .cornerRadius(14)
//                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
//                    textRounded(text: data[dataChosed])
//                    textRounded(text: detecterOfWin ? winOrLose[0] : winOrLose[1])
//                        Picker("", selection: $selectedIndex) {
//                            ForEach(0..<data.count, id: \.self) { index in
//                                textRounded(text: data[index])
//                                }
//                            }.pickerStyle(.segmented)
//                            .background(.white)
//                            .cornerRadius(18)
//                            .onChange(of: selectedIndex) { newValue in
//                                generateDecision(index: newValue)
//                            }
//                    }.alert("Game Over", isPresented: $showAlertMessage) {
//                        Button("Restart") {}
//                    } message: {
//                        Text("Score: \(pointCounter)")
//                    }
//                    .padding(40)
//                }.padding(40)
//            }
        
        
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("My Location")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text("Warsaw")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                    Text("-4")
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                    Text("Most Clody")
                        .foregroundColor(.white)
                    Text("H:-1, L:-8")
                        .foregroundColor(.white)
                    Spacer()
                        .frame(height: 50)
                }
                
                VStack {
                    VStack {
                        Text("Clooudy condytion will continue all day. Wind gusts are up to 7 m/s")
                            .foregroundColor(.white)
                            .padding(8)
                        Color.white
                            .frame(maxWidth: .infinity, maxHeight: 1)
                        HStack {
                            ForEach(1...7, id: \.self) {
                                DataTempView(text: $0.description)
                            }
                        }
                    }.background(.secondary)
                        .cornerRadius(13)
                        .padding()
                    
                    
                    VStack {
                        Text("10-day forecast")
                            .padding(10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.orange)
                        Color.white
                            .frame(maxWidth: .infinity, maxHeight: 1)
                        
                    }
                    .cornerRadius(13)
                    .padding()
                }
            }
        }
    }
        
    private func generateDecision(index: Int) {
        counterOfGame += 1
        if counterOfGame <= 4 {
            let random = Int.random(in: 0..<data.count)
            dataChosed = random
            detecterOfWin = Bool.random()
            
            checkAnswer(given: data[random],
                        answered: data[index],
                        win: detecterOfWin)
        } else {
            showAlertMessage = true
        }
    }
    
    private func restartGame() {
        counterOfGame = 0
        showAlertMessage = false
    }
    
    private func checkAnswer(given: String, answered: String, win: Bool) {
        let rock = data[0]
        let papper = data[1]
        let scissor = data[2]

        if given == rock {
            if win && answered == scissor || !win && answered == papper{
                pointCounter += 1
            } else {
                pointCounter -= 1
            }
        } else if given == papper {
            if win && answered == rock || !win && answered == scissor {
                pointCounter += 1
            } else {
                pointCounter -= 1
            }
        } else if given == scissor {
            if win && answered == papper || !win && answered == rock {
                pointCounter += 1
            } else {
                pointCounter -= 1
            }
        }
    }
}

struct DataTempView: View {
    
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
            Spacer()
                .frame(height: 10)
            Image(systemName: "cloud")
            Spacer()
                .frame(height: 10)
            Text("-3")
        }.padding(10)
            .foregroundColor(.white)
    }
    
}

struct TextModifier: ViewModifier {
    
    let text: String
        
    func body(content: Content) -> some View {
        Text(text)
            .padding()
            .background(.white)
            .cornerRadius(20)
    }
}

extension View {
    
    func textRounded(text: String) -> some View {
        modifier(TextModifier(text: text))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
