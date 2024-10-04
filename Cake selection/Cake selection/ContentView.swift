//
//  ContentView.swift
//  Cake selection
//
//  Created by admin4 on 4/10/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    
    var body: some View {
        VStack {
            Text("\(score)")
                .font(.largeTitle)
            Button("2"){
                score += 1
            }
            

            Spacer()
            
                        }
        .padding()
    }
}

#Preview {
    ContentView()
}
