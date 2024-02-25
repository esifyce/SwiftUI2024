//
//  OnChangeWithObservable.swift
//  SwiftUIEssentialsBMS
//
//  Created by Krasivo on 25.02.2024.
//

import SwiftUI

struct OnChangeWithObservable: View {
    @State var oo = OnChangeWithObservableOO()
    @State private var isProcessing = true
    
    var body: some View {
        List(oo.data, id: \.self) { datum in
            Text(datum)
        }
        .overlay {
            if isProcessing {
                ProgressView()
                    .padding()
                    .background(.black.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
            }
        }
        .font(.title)
        .onAppear() {
            oo.fetchData()
        }
        .onChange(of: oo.data, initial: false) { _, _ in
            isProcessing = false
        }
    }
}

@Observable
class OnChangeWithObservableOO {
    var data: [String] = []
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            data = ["Datum 1", "Datum 2", "Datum 3"]
        }
    }
}
