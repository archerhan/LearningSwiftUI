//
//  PokemonListRootView.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/6/10.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonListRootView: View {
    var body: some View {
        NavigationView {
            PokemonList().navigationBarTitle(Text("宝可梦列表"))
        }
    }
}

struct PokemonListRootView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListRootView()
    }
}
