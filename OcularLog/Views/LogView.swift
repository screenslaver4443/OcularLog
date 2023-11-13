//
//  LogView.swift
//  OcularLog
//
//  Created by Nikolai Pesudovs on 25/10/2023.
//

import SwiftUI
import Foundation
import Neumorphic

struct LogView: View {
    let defaults = UserDefaults.standard
    let today = Date.now
    let questions = ["reading?", "seeing in the distance?", "recognising faces across the street?", "watching tv?", "seeing in bright light?", "seeing in poor light?", "appreciating colours?", "driving a car during the day?", "driving a car during the night?", "walking inside?", "walking outside?", "using steps & stairs?", "crossing the road?", "using public transport?", "travelling independently?", "moving in unfamilair surroundings?", "doing employment/housework/education activities?", "doing hobbies/leisure activities?"]
    let imageNames = ["reading", "distance", "faces", "tv", "brightlight", "darklight", "colour", "car", "car", "indoorwalking", "outdoorwalking", "stairs", "streetcrossing", "publictransport", "independenttravel", "surroundings", "work","hobbies"]
    let date = Date.now.formatted(date: .numeric, time: .omitted)
    @State var answers : Array<Double> = []
    @State var questionNumber = 0
    @State var finished :Bool = false
    var body: some View {
        VStack(){
            if (finished == false){
                VStack(){
                    Text("How much difficulty are you having: ").font(.title)+Text(questions[questionNumber])
                        .font(.title)
                    Image(imageNames[questionNumber])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 200, maxWidth: 300, minHeight: 250, maxHeight: 350)
                        .padding()
                    HStack(){
                        Button(action: {submit(answer: 1)}){
                            Text("None at All")
                        }.softButtonStyle(RoundedRectangle(cornerRadius: 20), pressedEffect: .flat)
                        Button(action: {submit(answer: 2)}){
                            Text("A little Bit")
                        }.softButtonStyle(RoundedRectangle(cornerRadius: 20), pressedEffect: .flat)
                        Button(action: {submit(answer: 3)}){
                            Text("Quite a Bit")
                        }.softButtonStyle(RoundedRectangle(cornerRadius: 20), pressedEffect: .flat)
                        Button(action: {submit(answer: 4)}){
                            Text("Quite a Lot")
                        }.softButtonStyle(RoundedRectangle(cornerRadius: 20), pressedEffect: .flat)
                    }
                    
                }.padding()
                Spacer()
            }
            else{
                Text(Date.now.formatted(date: .long, time: .omitted)).font(.largeTitle)+Text(" has been logged.").font(.largeTitle)
                Button("Replace Response"){
                    finished = false
                    questionNumber = 1
                }.softButtonStyle(.capsule, pressedEffect: .flat)
                
            }
        }
        
        
    }
    
    func submit(answer: Int){
        answers.append(Double(answerCalc(enteredAnswer: answer)))
        chooseQuestion(answer: answer)
    }
    func averageArray(array: Array<Double>) -> Double{
        var returnValue = 0.0
        for i in array {
            returnValue += i
        }
        return returnValue
    }
    func chooseQuestion(answer: Int){
        //Placeholder until scoring system is known
        if (questionNumber <= questions.count-2){
            questionNumber += 1
        }
        else{
            finished = true
            let arrayKey = String(date)+"array"
            let averageScore = averageArray(array: answers)
            let averageKey = String(date)+"average"
            var datesLogged = defaults.array(forKey: "datesArray") ?? []
            datesLogged.append(date)
            defaults.set(answers, forKey: arrayKey)
            defaults.set(averageScore, forKey: averageKey)
            defaults.set(datesLogged, forKey: "datesArray")
        }
    }
    func answerCalc(enteredAnswer: Int) -> Float{
        switch questionNumber+1{
        case 1:
            if (enteredAnswer == 1){
                return (-4.35)
            }
            if (enteredAnswer == 2){
                return (-2.06)
            }
            if (enteredAnswer == 3){
                return (0.09)
            }
            if (enteredAnswer == 4){
                return (2.17)
            }
        case 2:
            if (enteredAnswer == 1){
                return (-3.86)
            }
            if (enteredAnswer == 2){
                return (-1.57)
            }
            if (enteredAnswer == 3){
                return (0.58)
            }
            if (enteredAnswer == 4){
                return (2.66)
            }
        case 3:
            if (enteredAnswer == 1){
                return (-3.56)
            }
            if (enteredAnswer == 2){
                return (-1.27)
            }
            if (enteredAnswer == 3){
                return (0.89)
            }
            if (enteredAnswer == 4){
                return (2.97)
            }
        case 4:
            if (enteredAnswer == 1){
                return (-3.06)
            }
            if (enteredAnswer == 2){
                return (-0.78)
            }
            if (enteredAnswer == 3){
                return (1.38)
            }
            if (enteredAnswer == 4){
                return (3.46)
            }
        case 5:
            if (enteredAnswer == 1){
                return (-4.42)
            }
            if (enteredAnswer == 2){
                return (-2.14)
            }
            if (enteredAnswer == 3){
                return (0.02)
            }
            if (enteredAnswer == 4){
                return (2.1)
            }
        case 6:
            if (enteredAnswer == 1){
                return (-4.53)
            }
            if (enteredAnswer == 2){
                return (-2.24)
            }
            if (enteredAnswer == 3){
                return (-0.08)
            }
            if (enteredAnswer == 4){
                return (1.99)
            }
        case 7:
            if (enteredAnswer == 1){
                return (-1.49)
            }
            if (enteredAnswer == 2){
                return (0.8)
            }
            if (enteredAnswer == 3){
                return (2.96)
            }
            if (enteredAnswer == 4){
                return (5.04)
            }
        case 8:
            if (enteredAnswer == 1){
                return (-1.93)
            }
            if (enteredAnswer == 2){
                return (0.36)
            }
            if (enteredAnswer == 3){
                return (2.51)
            }
            if (enteredAnswer == 4){
                return (4.59)
            }
        case 9:
            if (enteredAnswer == 1){
                return (-4.35)
            }
            if (enteredAnswer == 2){
                return (-2.06)
            }
            if (enteredAnswer == 3){
                return (0.1)
            }
            if (enteredAnswer == 4){
                return (2.17)
            }
            //Begin Mobility
        case 10:
            if (enteredAnswer == 1){
                return (-2.34)
            }
            if (enteredAnswer == 2){
                return (0.49)
            }
            if (enteredAnswer == 3){
                return (3.52)
            }
            if (enteredAnswer == 4){
                return (5.96)
            }
        case 11:
            if (enteredAnswer == 1){
                return (-3.75)
            }
            if (enteredAnswer == 2){
                return (-0.92)
            }
            if (enteredAnswer == 3){
                return (2.11)
            }
            if (enteredAnswer == 4){
                return (4.54)
            }
        case 12:
            if (enteredAnswer == 1){
                return (-5.74)
            }
            if (enteredAnswer == 2){
                return (-2.92)
            }
            if (enteredAnswer == 3){
                return (0.11)
            }
            if (enteredAnswer == 4){
                return (2.55)
            }
        case 13:
            if (enteredAnswer == 1){
                return (-4.69)
            }
            if (enteredAnswer == 2){
                return (-1.86)
            }
            if (enteredAnswer == 3){
                return (1.17)
            }
            if (enteredAnswer == 4){
                return (3.6)
            }
        case 14:
            if (enteredAnswer == 1){
                return (-4.55)
            }
            if (enteredAnswer == 2){
                return (-1.73)
            }
            if (enteredAnswer == 3){
                return (1.3)
            }
            if (enteredAnswer == 4){
                return (3.74)
            }
        case 15:
            if (enteredAnswer == 1){
                return (-3.85)
            }
            if (enteredAnswer == 2){
                return (-1.02)
            }
            if (enteredAnswer == 3){
                return (2.01)
            }
            if (enteredAnswer == 4){
                return (4.45)
            }
        case 16:
            if (enteredAnswer == 1){
                return (-4.98)
            }
            if (enteredAnswer == 2){
                return (-2.16)
            }
            if (enteredAnswer == 3){
                return (0.87)
            }
            if (enteredAnswer == 4){
                return (3.31)
            }
            //End Mobility
        case 17:
            if (enteredAnswer == 1){
                return (-1.83)
            }
            if (enteredAnswer == 2){
                return (0.45)
            }
            if (enteredAnswer == 3){
                return (2.61)
            }
            if (enteredAnswer == 4){
                return (4.69)
            }
        case 18:
            if (enteredAnswer == 1){
                return (-3.22)
            }
            if (enteredAnswer == 2){
                return (-0.93)
            }
            if (enteredAnswer == 3){
                return (1.23)
            }
            if (enteredAnswer == 4){
                return (3.3)
            }
            
        default:
            return (0.0)
        }
        return 0
    }
}
#Preview {
    LogView()
}
