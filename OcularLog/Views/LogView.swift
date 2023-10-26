//
//  LogView.swift
//  OcularLog
//
//  Created by Nikolai Pesudovs on 25/10/2023.
//

import SwiftUI

let questions = ["Placeholder"]
let imageNames = ["Reading"]
var questionNumber = 0


struct LogView: View {
    @State private var questiontext = questions[questionNumber]
    @State private var answers : [Int] = []
    @State private var unroundedanswer: Double = 0

    var body: some View {
        VStack(){
            VStack(){
                Text(questiontext)
                    .font(.largeTitle)
                    .bold()
                Image(imageNames[questionNumber])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                HStack(){
                    Text("Not at All")
                    Slider(value: $unroundedanswer,
                           in: 0 ... 4,
                           step: 1)
                    Text("Quite A Lot")
                }
                .padding()
                
                Text(String(Int(unroundedanswer.rounded())))
                    .foregroundColor(.blue)
                    .font(.title2)
                
            }
            Spacer()
        }
        
    }
}

#Preview {
    LogView()
}
