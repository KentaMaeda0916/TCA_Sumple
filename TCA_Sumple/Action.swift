//
//  Action.swift
//  TCA_Sumple
//
//  Created by まえけん on 2022/07/17.
//

enum AppAction: Equatable {
  case factAlertDismissed
  case decrementButtonTapped
  case incrementButtonTapped
  case numberFactButtonTapped
  case numberFactResponse(Result<String, ApiError>)
}

struct ApiError: Error, Equatable {}


