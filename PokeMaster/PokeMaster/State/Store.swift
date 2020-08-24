//
//  Store.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/8/20.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Combine

class Store: ObservableObject {
    @Published var appState = AppState()
    
    func dispatch(_ action: AppAction) {
        #if DEBUG
        print("[ACTION]: \(action)")
        #endif
        
        let result = Store.reduce(state: appState, action: action)
        appState = result.0
        
        if let command = result.1 {
            #if DEBUG
            print("[COMMADN]: \(command)")
            #endif
            command.execute(in: self)
        }
    }
    
    static func reduce(
      state: AppState,
      action: AppAction
    ) -> (AppState, LoginAppCommand?)
    {
      var appState = state
      var appCommand: LoginAppCommand?

      switch action {
      case .login(let email, let password):
        // 1
        guard !appState.settings.loginRequesting else {
          break
        }
        appState.settings.loginRequesting = true
        // 2
        appCommand = LoginAppCommand(
          email: email, password: password
        )
      case .accountBehaviorDone(result: let result):
        appState.settings.loginRequesting = false
        switch result {
        case .success(let user):
            appState.settings.loginUser = user
        case .failure(let error):
            print("Error: \(error)")
        }
        }

      return (appState, appCommand)
    }
}
