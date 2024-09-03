//
//  model.swift
//  auladeapi
//
//  Created by Turma02-24 on 30/08/24.
//

import Foundation

struct Filme: Decodable{
    let _id: String
    let nome : String?
    let genero : String?
    let nota : Double?
    let img : String?
}
