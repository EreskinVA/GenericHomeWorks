protocol Addable
{
    func add(_ a: Self) -> Self
}

extension Int: Addable
{
    func add(_ value: Int) -> Int
    {
        return value + self
    }
}

extension String: Addable
{
    func add(_ value: String) -> String
    {
        return self + value
    }
}

func sumTwoValues<T: Addable> (_ firstValue: T, _ twoValues: T) ->T
{
    return firstValue.add(twoValues)
}


let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d)
print(resultString)
