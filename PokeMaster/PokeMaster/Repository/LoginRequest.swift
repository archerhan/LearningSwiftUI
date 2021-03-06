//
//  LoginRequest.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/8/21.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import Combine

struct LoginRequest {
    let email: String
    let password: String
    
    var publisher: AnyPublisher<User, AppError> {
        Future { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
                if self.password == "password" {
                    let user = User(
                        email: self.email, favPokemonIDs: [])
                    promise(.success(user))
                } else {
                    promise(.failure(.passwordWrong))
                }
            }
        }
        .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
    }
}
