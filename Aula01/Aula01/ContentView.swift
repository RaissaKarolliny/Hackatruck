//
//  ContentView.swift
//  Aula01
//
//  Created by Turma02-24 on 21/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Text(".")
                .frame(width:100, height:100)
                .background(.red)
                Spacer()
                Text(".")
                .frame(width:100, height:100)
                .background(.blue)
                
            }
            Spacer()
            HStack{
                Text(".")
                .frame(width:100, height:100)
                .background(.green)
                Spacer()
                Text(".")
                .frame(width:100, height:100)
                .background(.yellow)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
