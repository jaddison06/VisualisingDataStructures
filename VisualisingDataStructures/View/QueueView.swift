//
//  QueueView.swift
//  VisualisingDataStructures
//
//  Created by Addison, James (JNO) on 22/03/2023.
//

import SwiftUI

struct QueueView: View {
    @StateObject private var queue = Queue<Int>()
    
    var body: some View {
        HStack(alignment: .bottom) {
            Button("Push") {
                queue.push(Int.random(in: 0...15))
            }
            VStack(alignment: .trailing) {
                Spacer()
                if queue.count == 1 {
                    Text("Head/Tail -> \(queue.array[queue.count - 1])")
                        .padding([.leading, .trailing], 25.0)
                        .padding(.top, 15.0)
                } else if queue.count >= 2 {
                    Text("Head -> \(queue.array[queue.count - 1])")
                        .padding([.leading, .trailing], 25.0)
                        .padding(.top, 15.0)
                    
                    ForEach(queue.array.reversed()[1..<queue.count - 1], id: \.self) {
                        Text("\($0)")
                            .padding([.leading, .trailing], 25.0)
                            .padding(.top, 15.0)
                    }
                    
                    Text("Tail -> \(queue.array[0])")
                        .padding([.leading, .trailing], 25.0)
                        .padding(.top, 15.0)
                }
            }
            Button("Pop") {
                try? queue.pop()
            }
        }
    }
}

struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
    }
}
