//
//  ContentView.swift
//  OcularLog
//
//  Created by Nikolai Pesudovs on 19/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Today")
                .font(.largeTitle)
                .bold()
            VStack() {
                Text("PlaceHolder")
            }
                .frame(width: 350, height: 300)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).stroke(.black, lineWidth: 10).fill(.cyan).frame(width: 350, height: 300))
        }
        .padding()
        
    }
}
#Preview {
    ContentView()
}
