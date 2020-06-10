//
//  ToolButtonModifier.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/6/8.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct ToolButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width:30, height: 30)
    }
}
