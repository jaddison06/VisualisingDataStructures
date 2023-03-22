//
//  StackView.swift
//  VisualisingDataStructures
//
//  Created by Addison, James (JNO) on 22/03/2023.
//

import SwiftUI

struct StackView: View {
    @StateObject private var stack = Stack<Int>()
    
    var body: some View {
        HStack(alignment: .bottom) {
            Button("Push") {
                stack.push(Int.random(in: 0...15))
            }
            VStack(alignment: .trailing) {
                Spacer()
                if stack.count > 0 {
                    Text("Head -> \(stack.array[stack.count - 1])")
                        .padding([.leading, .trailing], 25.0)
                        .padding(.top, 15.0)
                    
                    ForEach(stack.array.reversed()[1..<stack.count], id: \.self) {
                        Text("\($0)")
                            .padding([.leading, .trailing], 25.0)
                            .padding(.top, 15.0)
                    }
                }
            }
            Button("Pop") {
                try? stack.pop()
            }
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
