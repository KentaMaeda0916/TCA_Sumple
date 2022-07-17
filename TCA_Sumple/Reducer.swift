//
//  Reducer.swift
//  TCA_Sumple
//
//  Created by まえけん on 2022/07/17.
//
import ComposableArchitecture

// 各Actionに対応する「Stateへの処理」と「実行するべきEffect」
let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
        case .factAlertDismissed:
            // アラートに表示する文字列を空に
            state.numberFactAlert = nil
            return .none

        case .decrementButtonTapped:
            // デクリメント
            state.count -= 1
            return .none

        case .incrementButtonTapped:
            // インクリメント
            state.count += 1
            return .none

        case .numberFactButtonTapped:
            // 非同期処理
            return environment.numberFact(state.count)
                // スレッド指定？
                .receive(on: environment.mainQueue)
                // ↑に渡す
                .catchToEffect()
                // ここで実行した結果を
                .map(AppAction.numberFactResponse)

        case let .numberFactResponse(.success(fact)):
            // 成功
            state.numberFactAlert = fact
            return .none

        case .numberFactResponse(.failure):
            // 失敗
            state.numberFactAlert = "Could not load a number fact :("
            return .none
    }
}
