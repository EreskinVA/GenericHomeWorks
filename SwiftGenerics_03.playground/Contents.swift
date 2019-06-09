
enum List<Element> {
    case End
    indirect case Node(Element, next: List<Element>)
    
    func cons(_ element: Element) -> List {
        return .Node(element, next: self)
    }
    
    mutating func push(_ element: Element) {
        self = self.cons(element)
    }
    
    mutating func pop() -> Element? {
        switch self {
        case .End: return nil
        case let .Node(element, next: nextElement):
            self = nextElement
            return element
        }
    }
}


var stack = List<Int>.End.cons(1).cons(2).cons(3)
var copyStack = stack
var b = stack

copyStack.pop()
copyStack.pop()
copyStack.pop()

stack.pop()
stack.push(4)

stack.pop()
stack.pop()
stack.pop()

