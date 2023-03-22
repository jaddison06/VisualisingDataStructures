//
//  LinkedListView.swift
//  VisualisingDataStructures
//
//  Created by Addison, James (JNO) on 22/03/2023.
//

import SwiftUI

struct LinkedListView: View {
    @StateObject var list = OrderedLinkedList<Int>()
    
    var body: some View {
        VStack {
            HStack {
                ForEach(list.array) { item in
                    VStack {
                        HStack {
                            Text("\(item.value)")
                            Divider()
                            if let next = item.next {
                                Text("\(next.value)")
                            } else {
                                Text("-")
                            }
                        }
                        Divider()
                        Button("Remove") {
                            list.remove(item.id)
                        }
                    }
                }
            }
            Button("Add") {
                list.add(Int.random(in: 0...30))
            }
        }
    }
}

struct LinkedListView_Previews: PreviewProvider {
    static var previews: some View {
        LinkedListView()
    }
}
