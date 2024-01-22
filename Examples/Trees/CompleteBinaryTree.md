Visual representation of Complete Binary Tree
```swift
    1
   / \
  2   3
 / \ /
4  5 6
```

How to determine if the tree is Complete:
```swift
func isCompleteBinaryTree(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    
    var queue: [TreeNode?] = [root]
    var foundEnd = false
    
    while let currentNode = queue.removeFirst() {
        if currentNode == nil {
            foundEnd = true
        } else {
            if foundEnd { return false } // If a nil has been found, no more nodes should follow
            queue.append(currentNode.left)
            queue.append(currentNode.right)
        }
    }
    return true
}
```
The function `isCompleteBinaryTree` uses a queue to traverse the tree level by level. 
When a `nil` (empty) child is encountered, the flag `foundEnd` is set to true. 
If any nodes are encountered after this flag is set, the function returns false, indicating that the tree is not complete. 
If the traversal finishes without any such occurrence, the tree is considered complete.
