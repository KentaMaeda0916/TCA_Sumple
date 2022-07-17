//
//  TCA_SumpleApp.swift
//  TCA_Sumple
//
//  Created by まえけん on 2022/07/17.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCABasicUsageApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(
        store: Store(
          initialState: AppState(),
          reducer: appReducer,
          environment: AppEnvironment(
            mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
            numberFact: { number in
              Effect(value: "\(number) is a good number Brent")
            }
          )
        )
      )
    }
  }
}
