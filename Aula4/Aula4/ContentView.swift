//
//  ContentView.swift
//  Aula4
//
//  Created by Turma02-24 on 26/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            rosa()
            .tabItem {
                Label("Rosa", systemImage: "doc.circle.fill")
            }
            azul()
            .tabItem {
                Label("azul", systemImage: "house")
            }
           cinza()
            .tabItem {
                Label("Cinza", systemImage: "arrowshape.up.circle")
            }
            list()
            .tabItem {
                Label("Lista", systemImage: "paperclip.circle.fill")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
