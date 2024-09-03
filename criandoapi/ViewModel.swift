//
//  viewModel.swift
//  auladeapi
//
//  Created by Turma02-24 on 30/08/24.
//

import Foundation
class ViewModel: ObservableObject{
    @Published var filminho: [Filme] = []
    
    
    func fetch(){
        let task = URLSession.shared.dataTask(with: URL(string:"http://127.0.0.1:1880/filme")!){ data, _,error in
            
            do {
                self.filminho = try JSONDecoder().decode([Filme].self, from: data!)
            }catch{
                print(error)
            }
        }
        task.resume()
        
    }
}
