//
//  SubscriptionToken.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/8/21.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import Combine

class SubscriptionToken {
    var cancellable: AnyCancellable?
    func unseal() { cancellable = nil }
}

extension AnyCancellable {
    func seal(in token: SubscriptionToken) {
        token.cancellable = self
    }
}
