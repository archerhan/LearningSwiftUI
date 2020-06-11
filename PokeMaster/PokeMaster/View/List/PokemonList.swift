//
//  PokemonList.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/6/8.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    @State var expandingIndex: Int?
    @State var searchText: String = ""
    var body: some View {
        ScrollView {
            TextField("搜索宝可梦", text:$searchText)
                .padding(EdgeInsets(
                    top: 10, leading: 20, bottom: 10, trailing: 20
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            ForEach(PokemonViewModel.all) { pokemon in
                PokemonInfoRow(model: pokemon, expanded: self.expandingIndex == pokemon.id)
                    .onTapGesture {
                        withAnimation(
                            .spring(
                                response: 0.55,
                                dampingFraction: 0.425,
                                blendDuration: 0
                            )
                        ) {
                            if self.expandingIndex == pokemon.id {
                                self.expandingIndex = nil
                            } else {
                                self.expandingIndex = pokemon.id
                            }
                        }
                        
                }
            }
        }
        .overlay(VStack {
            Spacer()
            PokemonInfoPanel(model: .sample(id: 1))
        }.edgesIgnoringSafeArea(.bottom))
    }
}
struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
