//
//  SettingView.swift
//  PokeMaster
//
//  Created by ArcherHan on 2020/6/10.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI



struct SettingView: View {
    
    @EnvironmentObject var store: Store
    var settingBinding: Binding<AppState.Settings> {
        $store.appState.settings
    }
    var settings: AppState.Settings {
        store.appState.settings
    }
    var body: some View {
        Form {
            accountSection
            optionSection
        }
    }
    ///账户
    var accountSection: some View {
        Section(header: Text("账户")) {
            if settings.loginUser == nil {
                    Picker(selection: settingBinding.accountBehavior, label: Text("")) {
                        ForEach(AppState.Settings.AccountBehavior.allCases, id: \.self) {
                            Text($0.text)
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("电子邮箱", text: settingBinding.email)
                    SecureField("密码", text: settingBinding.password)
                    
                    if settings.accountBehavior == .register {
                        SecureField("确认密码", text: settingBinding.verifyPassword)
                    }
                    Button(settings.accountBehavior.text) {
                        self.store.dispatch(.login(email: self.settings.email, password: self.settings.password))
                    }
            }
            else {
                Text(settings.loginUser!.email)
                Button("注销") {
                    print("注销")
                }
            }

        }
    }
    ///选项
    var optionSection: some View {
        Section(header: Text("选项")) {
            Toggle(isOn: settingBinding.showEnName) {
                Text("显示英文名")
            }
            Picker(selection: settingBinding.sorting, label: Text("排序方式")) {
                ForEach(AppState.Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle(isOn: settingBinding.showFavOnly) {
                Text("只显示收藏")
            }
        }
    }
}

extension AppState.Settings.Sorting {
    var text: String {
        switch self {
        case .id: return "ID"
        case .name: return "名字"
        case .color: return "颜色"
        case .favorite: return "最爱"
        
        }
    }
}

extension AppState.Settings.AccountBehavior {
    var text: String {
        switch self {
        case .register: return "注册"
        case .login: return "登录"
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(Store())
    }
}
