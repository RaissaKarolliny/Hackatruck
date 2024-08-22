//
//  ex2.swift
//  Aula01
//
//  Created by Turma02-24 on 21/08/24.
//

import SwiftUI

struct ex2: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                VStack{
                    Text("Hackatrack")
                        .foregroundStyle(.red)
                    Text("77 Universidades")
                        .foregroundStyle(.blue)
                    Text("5 regiões do brazil")
                        .foregroundStyle(.yellow)
                }
                
            }
            Spacer()
        }
        
    }
}

#Preview {
    ex2()
}
