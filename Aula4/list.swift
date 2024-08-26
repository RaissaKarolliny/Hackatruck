//
//  list.swift
//  Aula4
//
//  Created by Turma02-24 on 26/08/24.
//

import SwiftUI

struct list: View {
    
    var itens = ["banana","melancia"
    ]
    
    var body: some View {
        NavigationView {
            List(itens, id: \.self){ itens in
                Text(itens)
                
                
            }
            .navigationTitle("frutas")
        }
        
    }
}
            
        
    


#Preview {
    list()
}
