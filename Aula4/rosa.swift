//
//  rosa.swift
//  Aula4
//
//  Created by Turma02-24 on 26/08/24.
//

import SwiftUI

struct rosa: View {
    var body: some View {
        
        ZStack{
            Color.pink
            Image(systemName: "paintbrush")
                .resizable()
                .scaledToFit()
                .padding(20)
                .frame(width:300, height: 300)
                .background(.black)
                .cornerRadius(900)
                .foregroundStyle(.pink)
            
        }
        
    }
}

#Preview {
    rosa()
}
