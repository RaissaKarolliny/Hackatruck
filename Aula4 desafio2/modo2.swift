//
//  modo2.swift
//  Aula4 desafio2
//
//  Created by Turma02-24 on 26/08/24.
//

import SwiftUI

struct modo2: View {
    @State var nome = "NOME"
    var body: some View {
        Text("Modo 2")
            .bold()
            .font(.system(size: 35))
        
        
        
        ZStack{
            Rectangle()
            .foregroundColor(.gray)
            .frame(width: 300, height: 200)
            .cornerRadius(20)
            VStack{
                TextField("nome:", text: $nome)
                    .bold()
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                
                Text("BEM-VINDO, \(nome)")
                    .bold()
                    .font(.system(size: 15))
                    .padding()
                
                NavigationLink(destination: modo2a()){
                    Text("Acessar tela")
                        .frame(width:100,height: 50)
                        .background(.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        
    }
}

#Preview {
    modo2()
}
