//
//  ContentView.swift
//  Aula4 desafio2
//
//  Created by Turma02-24 on 26/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet = false
    
    var body: some View {
        
        NavigationView{
          
                ZStack{
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .padding(30)
                        NavigationLink(destination: modo1()){
                            Text("Modulo 1")
                                .frame(width:200,height: 100)
                                .background(.pink)
                                .foregroundColor(.white)
                        }
                        NavigationLink(destination: modo2()){
                            Text("Modulo 2")
                                .frame(width:200,height: 100)
                                .background(.pink)
                                .foregroundColor(.white)
                        }
                        Button("Mostrar Folha") {
                                        showSheet.toggle()
                                                                            }
                        .frame(width:200,height: 100)
                        .background(.pink)
                        .foregroundColor(.white)
                        .sheet(isPresented: $showSheet) {
                            
                                      SheetView()
                                }
                        
                    }
                    
                }
                
                
                
                
                
            
        }
        .padding()
    }
}


struct SheetView: View {
    var body: some View {
        VStack {
            Text("Esta é uma folha!")
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
