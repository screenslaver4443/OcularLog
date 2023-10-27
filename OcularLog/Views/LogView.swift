//
//  LogView.swift
//  OcularLog
//
//  Created by Nikolai Pesudovs on 25/10/2023.
//

import SwiftUI

struct LogView: View {
    let questions = ["How much difficulty are you having reading?", "Difficulty seeing in the distance?", "Recognising faces across the street?", "Watching tv?", "Seeing in bright light?", "Seeing in poor light?", "Appreciating colours?", "Driving a car during the day?", "Driving a car during the night?", "Walking inside?", "Walking outside?", "Using steps & stairs?", "Crossing the road?", "Using public transport?", "Travelling independently?", "Moving in unfamilair surroundings?", "Employment/housework/education activities?", "Hobbies/leisure activities?"]
    let imageNames = ["Reading"]
    @State var questionNumber = 0
    @State var answers : [Int] = []
    @State var unroundedanswer: Double = 0
    
    var body: some View {
        VStack(){
            VStack(){
                Text(questions[questionNumber])
                    .font(.largeTitle)
                    .bold()
//                Image(imageNames[questionNumber])
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(minWidth: 200, maxWidth: 300, minHeight: 250, maxHeight: 350)
//                    .padding()
                HStack(){
                    Text("None at All")
                    Slider(value: $unroundedanswer,
                           in: 0 ... 4,
                           step: 1)
                    Text("Quite A Lot")
                }
                .padding()
                
                Text(String(Int(unroundedanswer.rounded())))
                    .foregroundColor(.blue)
                    .font(.title2)
                
                Button(action: {submit(answer: Int(unroundedanswer.rounded()))}){
                    Text("Submit Answer")
                }
                .buttonStyle(.bordered)
                
            }
            Spacer()
        }
        
        
    }
    func submit(answer: Int){
        answers.append(answer)
        chooseQuestion(answer: answer)
    }

    func chooseQuestion(answer: Int){
        //Placeholder until scoring system is known
        questionNumber += 1 //Will cause a crash if number exceeds questions array
    }
}

#Preview {
    LogView()
}
