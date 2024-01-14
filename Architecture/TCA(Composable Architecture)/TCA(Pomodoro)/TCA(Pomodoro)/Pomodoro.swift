//
//  Pomodoro.swift
//  TCA(Pomodoro)
//
//  Created by Krasivo on 15.01.2024.
//

import Foundation
import ComposableArchitecture

struct Pomodoro: Reducer {
    @Dependency(\.continuousClock) var clock
    
    var body: some ReducerOf<Pomodoro> {
        Reduce { state, action in
            switch action {
            case .startTapped:
                state.isTimerActivate = true
                return .run { send in
                    for await _ in clock.timer(interval: .seconds(1)) {
                        await send(.timerTicked)
                    }
                }
                .cancellable(id: TimerCancelID.cancel)
            case .stopTapped:
                state.isTimerActivate = false
                state.secondsElapsed = 0
                return .cancel(id: TimerCancelID.cancel)
            case .timerTitleChanged(let newTitle):
                state.timerTitle = newTitle
                return .none
            case .timerTicked:
                state.secondsElapsed += 1
                return .none
            }
        }
    }
    
    enum Action: Equatable {
        case startTapped
        case stopTapped
        case timerTitleChanged(String)
        case timerTicked
    }
    
    struct State: Equatable {
        var isTimerActivate = false
        var timerTitle = ""
        var secondsElapsed = 0
    }
}

private enum TimerCancelID { case cancel }
