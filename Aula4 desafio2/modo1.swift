//
//  modo1.swift
//  Aula4 desafio2
//
//  Created by Turma02-24 on 26/08/24.
//

import SwiftUI

struct modo1: View {
    @State var nome = ""
    var body: some View {
        Text("MODO 1")
            .bold()
            .font(.system(size: 35))
      
        
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 300, height: 200)
                .cornerRadius(20)
               
            VStack{
                Text("Nome: Raissa")
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                Text("Sobrenome: Rodrigues")
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(.white)
            }
            
        }
        
        
    }
}

#Preview {
    modo1()
}
