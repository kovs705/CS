Basic implementation:

```swift
 class Node {
   var value: Int
   var leftChild: Node?
   var rightChild: Node?

   init(_ value: Int) {
       self.value = value
   }
}
```

Example of Full binary tree
```swift
   1
  / \
 2  3
 / \ 
4  5 
  / \
 6  7
```

Check if tree is Full binary:
```swift
func isFullBinaryTree(_ node: Node?) -> Bool {
   guard let node = node else {
       return true
   }

   if node.leftChild == nil && node.rightChild == nil {
       return true
   }

   if node.leftChild != nil && node.rightChild != nil {
       return isFullBinaryTree(node.leftChild) && isFullBinaryTree(node.rightChild)
   }

   return false
}
```
This function works by recursively checking if each node in the tree has either zero or two children. 
If it finds a node with only one child, it returns false, 
indicating that the tree is not a full binary tree.
