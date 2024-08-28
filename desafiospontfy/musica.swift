//
//  musica.swift
//  desafiospontfy
//
//  Created by Turma02-24 on 27/08/24.
//

import SwiftUI

struct musica: View {
    var musica: Song
    
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient:Gradient(colors: [.blue,.gray]),
                startPoint: .topLeading, endPoint: .bottomLeading
            )
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                AsyncImage(url: URL(string: musica.foto)) { phase in
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

                Text("\(musica.nome)")
                    .bold()
                    .foregroundColor(.white)
                    .padding(2)
                Text("\(musica.cantor)")
                    .foregroundColor(.white)
                    .padding(10)
                    Spacer()
                
                HStack{
                    Image(systemName: "shuffle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30,height: 30 )
                        .clipped()
                        .foregroundColor(.white)
                        .padding(10)
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30,height: 30 )
                        .clipped()
                        .foregroundColor(.white)
                        .padding(10)
                    Image(systemName: "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:45,height: 45 )
                        .clipped()
                        .foregroundColor(.white)
                        .padding(10)
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30,height: 30 )
                        .clipped()
                        .foregroundColor(.white)
                        .padding(10)
                    Image(systemName: "repeat")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30,height: 30 )
                        .clipped()
                        .foregroundColor(.white)
                        .padding(10)
                    
                   
                    
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    musica(musica: Song(nome:" ",foto:" ",cantor:" "))
}
