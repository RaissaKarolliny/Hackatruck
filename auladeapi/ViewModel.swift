//
//  viewModel.swift
//  auladeapi
//
//  Created by Turma02-24 on 30/08/24.
//

import Foundation
class ViewModel: ObservableObject{
    @Published var person: [Personagem] = []
    
    
    func fetch(){
        let task = URLSession.shared.dataTask(with: URL(string:"https://hp-api.onrender.com/api/characters/house/gryffindor"
                                                       )!){data, _,error in do {
            self.person = try JSONDecoder().decode([Personagem].self, from: data!)
        }catch{
            print(error)
        }
        }
        task.resume()
        
    }
}
