//
//  PokemonInfoRow.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/6/8.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonInfoRow: View {
    let model: PokemonViewModel
    let expanded: Bool
    var body: some View {
        VStack {
            HStack {
                Image("Pokemon-\(model.id)")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 4)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(model.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    
                    Text(model.nameEN)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                }
            }
             .padding(.all, 15)
            Spacer()
            HStack(spacing: expanded ? 20 : -30) {
                Spacer()
                Button(action: {
                    print("star")
                }){
                    Image(systemName: "star")
                        .modifier(ToolButtonModifier())
                }
                Button(action: {
                    print("panel")
                }){
                    Image(systemName: "chart.bar")
                        .modifier(ToolButtonModifier())
                    
                }
                Button(action: {
                    print("web")
                }){
                    Image(systemName: "info.circle")
                        .modifier(ToolButtonModifier())
                    
                }
            }.padding(.bottom, 12)
                .padding(.trailing, 15)
                .opacity(expanded ? 1 : 0)
                .frame(maxHeight: expanded ? .infinity : 0) // 4
            
            
        }
            .frame(height: expanded ? 120 : 80) // 5
            .background(ZStack{
                RoundedRectangle(
                    cornerRadius: 20
                ).stroke(model.color, style: StrokeStyle(lineWidth:4))
                
                RoundedRectangle(cornerRadius: 20).fill(LinearGradient(
                    gradient: Gradient(colors: [.white, model.color]), startPoint: .leading, endPoint: .trailing))
            })
        .padding(.horizontal, 15)
        
    }
}

struct PokemonInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PokemonInfoRow(model: .sample(id: 1), expanded: false)
            PokemonInfoRow(model: .sample(id: 21), expanded: true)
            PokemonInfoRow(model: .sample(id: 25), expanded: false)
        }
    }
}
