class Node {
   var value: Int
   var next: Node?

   init(_ value: Int, _ next: Node? = nil) {
       self.value = value
       self.next = next
   }
}

class LinkedList {
   var head: Node?

   func append(_ value: Int) {
       let newNode = Node(value)
       if let lastNode = head {
           lastNode.next = newNode
       } else {
           head = newNode
       }
   }

   func getNode(at index: Int) -> Node? {
       guard index >= 0 else { return nil }
       var current = head
       for _ in 0..<index {
           current = current?.next
       }
       return current
   }

   func removeNode(at index: Int) -> Node? {
       guard index == 0 else { return nil }
       let removedNode = head
       head = head?.next
       if head == nil {
           tail = nil
       }
       return removedNode
   }
}
