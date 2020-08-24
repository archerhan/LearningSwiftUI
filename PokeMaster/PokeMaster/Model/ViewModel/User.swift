//
//  User.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/8/20.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation

struct User: Codable {
    var email: String
    var favPokemonIDs: Set<Int>
    func isFavPokemon(id: Int) -> Bool {
        favPokemonIDs.contains(id)
    }
}
