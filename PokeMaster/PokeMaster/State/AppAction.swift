//
//  AppAction.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/8/20.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation

enum AppAction {
    case login(email: String, password: String)
    case accountBehaviorDone(result: Result<User, AppError>)
}
