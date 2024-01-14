//
//  PomodoroTests.swift
//  TCA(Pomodoro)Tests
//
//  Created by Krasivo on 15.01.2024.
//

import XCTest
import ComposableArchitecture
@testable import TCA_Pomodoro_

let clock = TestClock()

final class PomodoroTests: XCTestCase {

    func testToggleinTimer() async throws {
        let store = TestStore(initialState: Pomodoro.State()) {
            Pomodoro()
        } withDependencies: {
            $0.continuousClock = clock
        }
        
        await store.send(.startTapped) {
            $0.isTimerActivate = true
        }
        
        await clock.advance(by: .seconds(3))
        await store.receive(.timerTicked) { $0.secondsElapsed = 1 }
        await store.receive(.timerTicked) { $0.secondsElapsed = 2 }
        await store.receive(.timerTicked) { $0.secondsElapsed = 3 }
        
        await store.send(.stopTapped) {
            $0.isTimerActivate = false
            $0.secondsElapsed = 0
        }
    }

}
