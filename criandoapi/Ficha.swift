//
//  musica.swift
//  desafiospontfy
//
//  Created by Turma02-24 on 27/08/24.
//

import SwiftUI

struct Ficha: View {
    var F: Filme
    
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient:Gradient(colors: [.white,.gray]),
                startPoint: .topLeading, endPoint: .bottomLeading
            )
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                AsyncImage(url: URL(string: F.img ?? "")) { phase in
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

                Text("\(F.nome ?? "")")
                    .bold()
                    .foregroundColor(.white)
                    .padding(2)
                Text("Gênero: \(F.genero ?? "nothing")")
                    .foregroundColor(.white)
                    .padding(2)
                Text("Nota:\( F.nota ?? 0)")
                    .foregroundColor(.white)
                    .padding(2)
                    Spacer()
                
               
                Spacer()
            }
            
        }
    }
}

#Preview {
    Ficha( F: Filme(_id: "", nome: "", genero: "", nota: 0, img: ""))
}


