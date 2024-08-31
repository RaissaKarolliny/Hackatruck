//
//  ContentView.swift
//  desafiospontfy
//
//  Created by Turma02-24 on 27/08/24.
//






import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
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
                        Image(.image)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width:200,height: 200 )
                            .clipped()
                            .padding(20)
                        
                        
                        HStack{
                            VStack{
                                Text("Clube do harry")
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        
                        
                        VStack{
                            ForEach(viewModel.person) { p in
                                NavigationLink(destination: Ficha(personagem:p)){
                                    
                                    HStack{
                                        AsyncImage(url: URL(string: "\(p.image ?? "")")) { phase in
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
                                            
                                            
                                            Text("\(p.name ?? "")")
                                                .bold()
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
                    
                    
                }
                
                .padding()
            }
            
        } .onAppear(){
            viewModel.fetch()
        }
    }
}


#Preview {
    ContentView()
}


