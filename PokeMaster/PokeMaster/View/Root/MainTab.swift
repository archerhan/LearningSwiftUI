//
//  MainTab.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/8/13.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct MainTab: View {
    var body: some View {
        TabView {
            // 1
            PokemonListRootView().tabItem {
                // 2
                Image(systemName: "list.bullet.below.rectangle")
                Text("列表")
            }

            SettingRootView().tabItem {
                Image(systemName: "gear")
                Text("设置")
            }
        }
        // 3
        .edgesIgnoringSafeArea(.top)
    }
}

struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}
