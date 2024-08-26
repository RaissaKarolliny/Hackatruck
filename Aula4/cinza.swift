//
//  cinza.swift
//  Aula4
//
//  Created by Turma02-24 on 26/08/24.
//

import SwiftUI

struct cinza: View {
    var body: some View {
        ZStack{
            Color.gray
            Image(systemName: "arrowshape.up.circle")
                .resizable()
                .scaledToFit()
                .padding(20)
                .frame(width:300, height: 300)
                .background(.black)
                .cornerRadius(900)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    cinza()
}
