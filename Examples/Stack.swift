struct Stack<T> {
   private var array = [T]()
   
   var isEmpty: Bool {
       return array.isEmpty
   }
   
   mutating func push(_ item: T) {
       array.append(item)
   }
   
   mutating func pop() -> T? {
       return array.popLast()
   }
   
   func peek() -> T? {
       return array.last
   }
}
