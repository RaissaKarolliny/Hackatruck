//
//  model.swift
//  auladeapi
//
//  Created by Turma02-24 on 30/08/24.
//

import Foundation

struct Personagem: Decodable, Identifiable{
    let id :String
    let name : String?
    let house : String?
    let dateOfBirth : String?
    let image : String?
}
