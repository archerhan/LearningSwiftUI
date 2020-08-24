//
//  AppState.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/8/20.
//  Copyright © 2020 OneV's Den. All rights reserved.
//


struct AppState {
    //存在同名的类，会优先使用局部类型
    var settings = Settings()
}

extension AppState {
    struct Settings {
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }
        var loginUser: User?
        var showEnName = true
        var sorting = Sorting.id
        var showFavOnly = false
        
        enum AccountBehavior: CaseIterable {
            case register, login
        }
        
        var accountBehavior = AccountBehavior.login
        var email = ""
        var password = ""
        var verifyPassword = ""
        
        var loginRequesting = false
    }
    
    
}

