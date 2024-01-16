Swift doesn't have a built-in Queue data structure, but you can make your own:

```swift
struct Queue<T> {
   private var array = [T]()

   var isEmpty: Bool {
       return array.isEmpty
   }

   mutating func enqueue(_ item: T) {
       array.append(item)
   }

   mutating func dequeue() -> T? {
       if isEmpty {
           return nil
       } else {
           return array.removeFirst()
       }
   }

   func peek() -> T? {
       return array.first
   }
}

```
