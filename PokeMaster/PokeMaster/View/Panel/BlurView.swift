//
//  BlurView.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/6/9.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {

    // 1
    let style: UIBlurEffect.Style

    func makeUIView(
        context: UIViewRepresentableContext<BlurView>)
    -> UIView
    {        
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear

        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)

        // 2
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor
                .constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor
                .constraint(equalTo: view.widthAnchor)
        ])
        return view
    }

    // 3
    func updateUIView(
        _ uiView: UIView,
        context: UIViewRepresentableContext<BlurView>)
    {
    }
}

extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }
    }
}
