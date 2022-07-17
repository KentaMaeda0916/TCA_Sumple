//
//  State.swift
//  TCA_Sumple
//
//  Created by まえけん on 2022/07/17.
//

import ComposableArchitecture

struct AppState: Equatable {
    // カウンタ
    var count = 0
    // アラートに表示される文字列
    var numberFactAlert: String?
}
