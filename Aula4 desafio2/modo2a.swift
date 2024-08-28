//
//  modo2a.swift
//  Aula4 desafio2
//
//  Created by Turma02-24 on 26/08/24.
//

import SwiftUI

struct modo2a: View {
    var nome : String
    var body: some View {
        Text("Modo 2")
            .bold()
            .font(.system(size: 35))
        Text("Volte, \(nome)")
            .bold()
            .font(.system(size: 35))
        
    }
}

#Preview {
    modo2a(nome : "teste")
}
