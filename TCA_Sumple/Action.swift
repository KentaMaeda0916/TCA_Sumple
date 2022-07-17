//
//  Action.swift
//  TCA_Sumple
//
//  Created by まえけん on 2022/07/17.
//

/// 画面内で発生しうるアクション
enum AppAction: Equatable {
    // アラートボタン押下
    case factAlertDismissed
    // マイナスボタン押下
    case decrementButtonTapped
    // プラスボタン押下
    case incrementButtonTapped
    // 「Number Fact」押下
    case numberFactButtonTapped
    // 「Number Fact」押下により発生するEffectの戻りアクション
    case numberFactResponse(Result<String, ApiError>)
}

struct ApiError: Error, Equatable {}


