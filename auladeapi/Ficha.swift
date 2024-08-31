//
//  musica.swift
//  desafiospontfy
//
//  Created by Turma02-24 on 27/08/24.
//

import SwiftUI

struct Ficha: View {
    var personagem: Personagem
    
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient:Gradient(colors: [.blue,.gray]),
                startPoint: .topLeading, endPoint: .bottomLeading
            )
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                AsyncImage(url: URL(string: personagem.image ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width:300,height: 300 )
                            .clipped()
                            .padding(20)
                        
                    case .failure:
                        Text("Failed to load image")
                    @unknown default:
                        Text("Unknown error")
                    }
                }

                Text("\(personagem.name ?? "")")
                    .bold()
                    .foregroundColor(.white)
                    .padding(2)
                Text("Data de Aniversário: \(personagem.dateOfBirth ?? "nothing")")
                    .foregroundColor(.white)
                    .padding(10)
                Text("\(personagem.house ?? "nothing")")
                    .foregroundColor(.white)
                    .padding(10)
                    Spacer()
                
               
                Spacer()
            }
            
        }
    }
}

#Preview {
    Ficha( personagem: Personagem(id: "", name: "", house: "", dateOfBirth: "", image: ""))
}


