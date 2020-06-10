//
//  PokemonInfoPanelHeader.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/6/9.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

extension PokemonInfoPanel {
    struct Header: View {
        let model: PokemonViewModel
        
        var body: some View {
            HStack(spacing: 18) {
                pokemonIcon
                nameSpecies
                verticalLine
                bodyStatus
            }
        }
        //精灵图片
        var pokemonIcon: some View {
            Image("Pokemon-\(model.id)")
                .resizable()
                .frame(width:68, height: 68)
                .shadow(radius: 3)
        }
        //名称简介
        var nameSpecies: some View {
            VStack {
                Text(model.name)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(model.color)
                Text(model.nameEN)
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(model.color).padding(.bottom, 10)
                Text(model.genus)
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }.padding(.trailing, 18)
        }
        //竖线
        var verticalLine: some View {
            Divider()
                .foregroundColor(.black)
                //                .opacity(0.1)
                .frame(width:1, height: 44)
                .padding(.vertical, 18)
        }
        //属性
        var bodyStatus: some View {
            VStack(alignment:.center) {
                VStack(alignment:.leading) {
                    HStack {
                        Text("身高")
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                        Text(model.height)
                            .font(.system(size: 11))
                            .foregroundColor(model.color)
                    }
                    HStack {
                        Text("体重")
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                        Text(model.weight)
                            .font(.system(size: 11))
                            .foregroundColor(model.color)
                    }
                }
                .padding(.bottom, 12)
                
                HStack {
                    ForEach(model.types) { type in
                        ZStack {
                            RoundedRectangle(cornerRadius: 7)
                                .frame(width:36, height: 14)
                                .foregroundColor(type.color)
                            
                            Text(type.name)
                                .font(.system(size: 11))
                                .foregroundColor(.white)
                        }
                        
                    }
                    
                }
            }
        }
    }
}

struct PokemonInfoPanelHeader_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel.Header(model: .sample(id: 1))
    }
}
