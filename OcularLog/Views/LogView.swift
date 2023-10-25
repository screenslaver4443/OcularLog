//
//  LogView.swift
//  OcularLog
//
//  Created by Nikolai Pesudovs on 25/10/2023.
//

import SwiftUI


let questions = ["Placeholder"]
var questionnumber = 0
var questiontext = questions[questionnumber]
var answers : [Int] = []

struct LogView: View {
    var body: some View {
        LazyVStack(){
            Text(questiontext)
                .font(.largeTitle)
                .bold()
            
        }
        
        Spacer()
    }
}

#Preview {
    LogView()
}
