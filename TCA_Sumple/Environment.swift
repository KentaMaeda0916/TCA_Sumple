//
//  Environment.swift
//  TCA_Sumple
//
//  Created by まえけん on 2022/07/17.
//
import ComposableArchitecture

// 依存対象の切り出し
struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    /// カウンタの値を引数にアラートに表示する文字列を生成
    var numberFact: (Int) -> Effect<String, ApiError>
}
