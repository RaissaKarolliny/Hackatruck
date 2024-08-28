//
//  ContentView.swift
//  desafiospontfy
//
//  Created by Turma02-24 on 27/08/24.
//






import SwiftUI

struct ContentView: View {
    
    var musicas = [
        Song(nome: "Partilhar", foto:"https://imagens.usp.br/wp-content/uploads/Campus-15-Foto-Marcos-Santos20101220_066.jpg", cantor: "Rubel"),
        Song(nome: "Surreal", foto:"https://imagens.usp.br/wp-content/uploads/Campus-15-Foto-Marcos-Santos20101220_066.jpg", cantor: "Luiza sonsa"),
        Song(nome: "Cardigan", foto:"https://imagens.usp.br/wp-content/uploads/Campus-15-Foto-Marcos-Santos20101220_066.jpg", cantor: "Taylor Swift"),
        Song(nome: "1", foto:"https://imagens.usp.br/wp-content/uploads/Campus-15-Foto-Marcos-Santos20101220_066.jpg", cantor: "Rubel"),
        Song(nome: "2", foto:"https://imagens.usp.br/wp-content/uploads/Campus-15-Foto-Marcos-Santos20101220_066.jpg", cantor: "Luiza sonsa"),
        Song(nome: "3", foto:"https://imagens.usp.br/wp-content/uploads/Campus-15-Foto-Marcos-Santos20101220_066.jpg", cantor: "Taylor Swift"),
        Song(nome: "4", foto:"https://imagens.usp.br/wp-content/uploads/Campus-15-Foto-Marcos-Santos20101220_066.jpg", cantor: "Rubel"),
        Song(nome: "5", foto:"https://imagens.usp.br/wp-content/uploads/Campus-15-Foto-Marcos-Santos20101220_066.jpg", cantor: "Luiza sonsa"),
        Song(nome: "5", foto:"https://imagens.usp.br/wp-content/uploads/Campus-15-Foto-Marcos-Santos20101220_066.jpg", cantor: "Taylor Swift")
    ]
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                LinearGradient(
                    gradient:Gradient(colors: [.blue,.gray]),
                    startPoint: .topLeading, endPoint: .bottomLeading
                )
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                ScrollView{
                    VStack {
                        Image(.stitch)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width:200,height: 200 )
                            .clipped()
                            .padding(20)
                        
                        
                        HStack{
                            VStack{
                                Text("Hacka FM")
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(.white)
                                
                                HStack{
                                    
                                    Image(.camii)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:30,height: 30 )
                                        .clipped()
                                    Text("HackaSong")
                                        .bold()
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                    
                                    
                                }}
                            Spacer()
                        }
                        
                        
                        VStack{
                            ForEach(musicas, id: \.self) { i in
                                NavigationLink(destination: musica(musica:i)){
                                    
                                    HStack{
                                        AsyncImage(url: URL(string: "\(i.foto)")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 40)
                                                    .clipped()
                                                
                                            case .failure:
                                                Text("Failed to load image")
                                            @unknown default:
                                                Text("Unknown error")
                                            }
                                        }
                                        VStack(alignment:.leading){
                                            
                                            
                                            Text("\(i.nome)")
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding(.horizontal,10)
                                            Text("\(i.cantor)")
                                                .foregroundColor(.white)
                                                .padding(.horizontal,10)
                                        }
                                        
                                        Spacer()
                                        Image(systemName:"ellipsis")
                                            .foregroundColor(.white)
                                        
                                        
                                    }}
                                .padding(.vertical,10)
                            }}
                        
                        
                        
                        
                        
                        
                    }
                    VStack(alignment:.leading){
                        Text("SUGERIDOS")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                        ScrollView(.horizontal){
                            HStack{
                                VStack{
                                    Image(.stitch)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width:100,height: 100 )
                                        .clipped()
                                        .padding(20)
                                    Text("1-one")}
                                VStack{
                                    Image(.stitch)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:100,height: 100 )
                                        .clipped()
                                        .padding(20)
                                    Text("1-one")}
                                VStack{
                                    Image(.stitch)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .frame(width:100,height: 100 )
                                        .clipped()
                                        .padding(20)
                                    Text("1-one")}
                                
                                
                            }
                        }}
                    
                }
               
                .padding()
            }
            
        }}
}


#Preview {
    ContentView()
}

struct Song : Hashable {
    
    var nome: String
    var foto: String
    var cantor : String
}
