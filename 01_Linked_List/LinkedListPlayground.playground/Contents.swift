import Foundation

public class LinkedListNode <T> {
    public var value: T
    public var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else { return nil }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    public var count: Int {
        guard var node = head else { return 0 }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
}




let list = LinkedList<Int>()
list.isEmpty
list.first
list.last

list.append(value: 1)
list.isEmpty
list.first?.value
list.last?.value
list.count

list.append(value: 2)
list.isEmpty
list.first?.value
list.last?.value
list.last?.previous?.value
list.count

list.append(value: 10)
list.isEmpty
list.first?.value
list.last?.value
list.last?.previous?.value
list.count
