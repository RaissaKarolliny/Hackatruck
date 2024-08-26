//
//  azul.swift
//  Aula4
//
//  Created by Turma02-24 on 26/08/24.
//

import SwiftUI

struct azul: View {
    var body: some View {
        
        ZStack{
            Color.blue
            Image(systemName: "house")
                .resizable()
                .scaledToFit()
                .padding(20)
                .frame(width:300, height: 300)
                .background(.black)
                .cornerRadius(900)
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    azul()
}
