//
//  ContentView.swift
//  Aula2
//
//  Created by Turma02-24 on 22/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var alert: Bool = false
    @State var name: String = "Fulano"
    var body: some View {
       
        VStack{
            
            ZStack{
               
            
                Image("Image")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.20)
                VStack{
                        Text("Bem vindo,\(name)")
                            .font(.system(size:30))
                            .bold()
                        TextField("fulano", text: $name)
                        .frame(width:330, alignment:.center)
                    
                        
                    Spacer()
                    Image("Image 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width:200)

                    Image("Image 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width:200)
                    Spacer()
                   Text("Entrar")
                        .onTapGesture {
                            alert = true
                        }
                        .alert(isPresented: $alert){
                            Alert(
                                title: Text("Alerta")
                                
                            )
                        }
                    
                   

                    
                    

                }
                
                
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
