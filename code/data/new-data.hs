
type MyType = [Int]

data MyData = Constructor1 | Constructor2 Int [Int] 

showParameters :: MyData -> String
showParameters Constructor1 = "no parameters"
showParameters (Constructor2 int listOfInt) = "int: " ++ show int ++ " lsitOfInt: " ++ show listOfInt

data MyList anyType = EmptyList | Cons anyType (MyList anyType)

newtype MyNewType = MyNewType [Int]


data MyRecordData = MyRecordData {
    record1 :: Int ,
    record2 :: Int -> String
}