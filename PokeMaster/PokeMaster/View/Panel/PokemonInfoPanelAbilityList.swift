//
//  PokemonInfoPanelAbilityList.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/6/9.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

extension PokemonInfoPanel {
  struct AbilityList: View {
    let model: PokemonViewModel
    let abilityModels: [AbilityViewModel]?

    var body: some View {
      VStack(alignment: .leading, spacing: 12) {
        Text("技能")
          .font(.headline)
          .fontWeight(.bold)
        if abilityModels != nil {
          ForEach(abilityModels!) { ability in
            Text(ability.name)
              .font(.subheadline)
              .foregroundColor(self.model.color)
            Text(ability.descriptionText)
              .font(.footnote)
              .foregroundColor(Color(hex: 0xAAAAAA))
              // 1
              .fixedSize(horizontal: false, vertical: true)
          }
        }
      }
      // 2
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}
