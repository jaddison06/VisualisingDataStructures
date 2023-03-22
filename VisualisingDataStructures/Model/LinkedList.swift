//
//  LinkedList.swift
//  VisualisingDataStructures
//
//  Created by Addison, James (JNO) on 22/03/2023.
//

import Foundation

class OrderedLinkedListNode<T : Comparable> : Identifiable & ObservableObject {
    let id = UUID()
    
    let value: T
    @Published var next: OrderedLinkedListNode<T>?
    
    var count: Int {
        if let next = next {
            return next.count + 1
        }
        return 1
    }
    
    init(_ value: T, _ next: OrderedLinkedListNode<T>? = nil) {
        self.value = value
        self.next = next
    }
    
    func add(_ value: T) -> OrderedLinkedListNode<T> {
        if let next = self.next {
            if next.value < value {
                return next.add(value)
            }
            self.next = OrderedLinkedListNode(value, next)
            return self.next!
        } else {
            self.next = OrderedLinkedListNode(value)
            return self.next!
        }
    }
    
    func contains(_ value: T) -> Bool {
        if (self.value == value) { return true }
        if let next = next {
            return next.contains(value)
        } else {
            return false
        }
    }
}

class OrderedLinkedList<T : Comparable> : ObservableObject {
    @Published var array: [OrderedLinkedListNode<T>] = []
    var root: OrderedLinkedListNode<T>? = nil
    
    var count: Int {
        return root?.count ?? 0
    }
    
    func add(_ item: T) {
        if let root = root {
            if (item < root.value) {
                self.root = OrderedLinkedListNode(item, root)
                array.append(self.root!)
            } else {
                array.append(root.add(item))
            }
        } else {
            root = OrderedLinkedListNode(item)
            array.append(root!)
        }
    }
    
    func remove(_ id: UUID) {
//        if let root = root {
//            if id == root.id {
//                self.root = root.next
//                return
//            }
//        }
        var previous: OrderedLinkedListNode<T>? = nil
        var current_ = root
        while let current = current_ {
            if current.id == id {
                if let previous = previous {
                    previous.next = current.next
                } else {
                    root = current.next
                }
            }
            previous = current
            current_ = current.next
        }
    }
    
    func contains(_ item: T) -> Bool {
        return root?.contains(item) ?? false
    }
}
