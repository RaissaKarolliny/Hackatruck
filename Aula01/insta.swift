//
//  insta.swift
//  Aula01
//
//  Created by Turma02-24 on 21/08/24.
//

import SwiftUI

struct insta: View {
    var body: some View {
        VStack{
            HStack{
                Text("username")
                    .frame(width:330, alignment: .leading)
                 
                    Rectangle()
                        .frame(width:10, height:10)
                        
                  
                    
                    
            
            }
            HStack{
                Circle()
                    .frame(width:110, height:110)
                    .foregroundStyle(.gray)
                    .padding()
                VStack{
                    HStack{
                        VStack{
                            Text("8")
                                .bold()
                            Text("Posts")
                                .bold()
                                .font(.system(size:10))
                            
                            
                        }
                        .padding()
                        VStack{
                            Text("12k")
                                .bold()
                            Text("seguidores")
                                .bold()
                                .font(.system(size:10))
                        }
                        .padding()
                        VStack{
                            Text("2k")
                                .bold()
                            Text("Seguindo")
                                .bold()
                                .font(.system(size:10))
                        }
                        .padding()
                    }
                    
                    
                    Text("Editar perfil")
                        .frame(width: 200)
                        .padding(5)
                        .background(.gray)
                    
                }
                
                
                
            }
            VStack{
                Text("Nome Sobrenome")
                    .bold()
                    .frame(width:330, alignment: .leading)
                Text("Besteirinhas")
                    .frame(width:330, alignment: .leading)
                    
                    
            }
        
            HStack{
               
                VStack{
                    Text("< >")
                        .padding(.vertical,10)

                    Rectangle()
                        .frame(width:110, height:130)
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width:110, height:130)
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width:110, height:130)
                        .foregroundStyle(.gray)
                    
                    
                }
                VStack{
                    Text("< >")
                        .padding(.vertical,10)

                    Rectangle()
                        .frame(width:110, height:130)
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width:110, height:130)
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width:110, height:130)
                        .foregroundStyle(.gray)
                    
                    
                }
                VStack{
                    Text("< >")
                        .padding(.vertical,10)

                    Rectangle()
                        .frame(width:110, height:130)
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width:110, height:130)
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width:110, height:130)
                        .foregroundStyle(.gray)
                    
                    
                }
              
            }
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    insta()
}
