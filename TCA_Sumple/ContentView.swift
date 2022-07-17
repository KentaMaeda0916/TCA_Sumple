//
//  ContentView.swift
//  TCA_Sumple
//
//  Created by まえけん on 2022/07/17.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {

    let store: Store<AppState, AppAction>

    var body: some View {
        // WithViewStoreでViewにStoreを組み込む
        WithViewStore(self.store) { viewStore in
            VStack {
                HStack {
                    // viewStore.send( でActionを送れる
                    Button("−") { viewStore.send(.decrementButtonTapped) }
                    Text("\(viewStore.count)")
                    Button("+") { viewStore.send(.incrementButtonTapped) }
                }

                Button("Number fact") { viewStore.send(.numberFactButtonTapped) }
            }
            .alert(
                // viewStore.binding ViewとViewStoreの双方向バインディング
                item: viewStore.binding(
                    // ViewStoreからの値の取得
                    get: { $0.numberFactAlert.map(FactAlert.init(title:)) },
                    // ViewStoreにActionを送る
                    send: .factAlertDismissed
                ),
                content: { Alert(title: Text($0.title)) }
            )
        }
    }
}

struct FactAlert: Identifiable {
    var title: String
    var id: String { self.title }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
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
