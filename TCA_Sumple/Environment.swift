//
//  Environment.swift
//  TCA_Sumple
//
//  Created by まえけん on 2022/07/17.
//
import ComposableArchitecture

struct AppEnvironment {
  var mainQueue: AnySchedulerOf<DispatchQueue>
  var numberFact: (Int) -> Effect<String, ApiError>
}
