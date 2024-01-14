//
//  ContentView.swift
//  TCA(Pomodoro)
//
//  Created by Krasivo on 14.01.2024.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<Pomodoro>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                Text(String(viewStore.secondsElapsed))
                    .foregroundColor(.blue)
                Button(
                    action: {
                        if viewStore.isTimerActivate {
                            viewStore.send(.stopTapped)
                        } else {
                            viewStore.send(.startTapped)
                        }
                    }, label: {
                        Image(
                            systemName: 
                                viewStore.isTimerActivate
                                ? "stop.circle.fill"
                                : "play.circle.fill"
                        )
                        .resizable()
                        .frame(width: 32, height: 32)
                    }
                )
                TextField(
                    "",
                    text: viewStore.binding(
                        get: \.timerTitle,
                        send: { .timerTitleChanged($0) }
                    ), prompt: Text("Set some text")
                    
                )
            }
            .padding()
        }
    }
}

#Preview {
    ContentView(store: Store(initialState: Pomodoro.State(), reducer: {
        Pomodoro()._printChanges()
    }))
}
