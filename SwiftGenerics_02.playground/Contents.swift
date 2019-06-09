// протокол Базовый контейнет
protocol ContainerProtocol {
    associatedtype ElementType
    mutating func append(item: ElementType)
    var count: Int { get }
    mutating func getElementOf(_ index: Int) -> ElementType?
}

// элемент связного списка
class Element<T>
{
    public let element: T
    public var nextElement: Element?
    public var prevElement: Element?
    
    init(element: T)
    {
        self.element = element
    }
}

// структура Связный список на основе базового протокола
struct ElementLinkedList<T: Element<Any>>: ContainerProtocol
{
    
    var elements = [T]()
    
    mutating func pop() -> T
    {
        return elements.removeLast()
    }
    
    mutating func append(item: T)
    {
        let prev = elements.last
        elements.append(item)
        prev?.nextElement = elements.last
        elements.last?.prevElement = prev
    }
    
    var count: Int
    {
        return elements.count
    }
    
    func getElementOf(_ index: Int) -> T?
    {
        if elements.indices.contains(index)
        {
            return elements[index]
        }
        else
        {
            print("Error, Index out of range")
            return nil
        }
    }
    
    mutating func getElementFIFO() -> T?
    {
        let elementFirst = self.elements.removeFirst()
        return elementFirst
    }
}

// массив на основе базового протокола
struct ElementListArray<T>: ContainerProtocol
{

    var elements = [T]()
    
    mutating func pop() -> T
    {
        return elements.removeLast()
    }
    
    mutating func append(item: T)
    {
        elements.append(item)
    }
    
    var count: Int
    {
        return elements.count
    }
    
    func getElementOf(_ index: Int) -> T?
    {
        if elements.indices.contains(index)
        {
            return elements[index]
        } else {
            print("Error, Index out of range")
            return nil
        }
    }
}

// -- Работа с массивом на основе базового протокола
var arrayList = ElementListArray<Any>()
arrayList.append(item: "Привет")
arrayList.append(item: 2)

print(arrayList.getElementOf(0))
print(arrayList.getElementOf(1))
print(arrayList.getElementOf(2))

// -- Работа со связным списком
var linkedList = ElementLinkedList()
linkedList.append(item: Element(element: "Привет"))
linkedList.append(item: Element(element: "мир"))
linkedList.append(item: Element(element: 2019))

let elementInLinkedList = linkedList.getElementOf(2)
print(elementInLinkedList?.element)
print(elementInLinkedList?.prevElement?.element)
print(elementInLinkedList?.nextElement?.element)


// -- пример получения элемента FIFO
print(linkedList.getElementOf(0)?.element)
linkedList.getElementFIFO()
print(linkedList.getElementOf(0)?.element)
