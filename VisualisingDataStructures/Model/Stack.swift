//
//  Stack.swift
//  VisualisingDataStructures
//
//  Created by Addison, James (JNO) on 22/03/2023.
//

import Foundation

class Stack<T> : ObservableObject {
    @Published var array: [T] = []
    
    var count: Int {
        return array.count
    }
    
    func push(_ item: T) {
        array.append(item)
    }
    
    func pop() throws -> T {
        guard count != 0 else {
            throw CollectionsError.CollectionIsEmpty
        }
        
        return array.removeLast()
    }
}
