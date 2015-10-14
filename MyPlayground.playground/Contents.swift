//
//  main.swift
//  BuildaCalculator
//
//  Created by marco cheng on 10/11/15.
//  Copyright © 2015 marco cheng. All rights reserved.
//

/*
Homework: Build a calculator

–create four functions for add, subtract, multiply, divide

each does the expected thing
–create a function that expects one of them along with two Ints

in other words, a generic "math operation" function
it should then take the two Ints and pass them to the function
and return the result

add(1,2) = 3
sub(2,3) = -1
mul(2,2) = 4
div(6,2) = 3

*/

import Foundation

var characters = NSMutableCharacterSet.whitespaceAndNewlineCharacterSet()
let punctuation = NSCharacterSet.punctuationCharacterSet()
characters.formUnionWithCharacterSet(punctuation)


//Input to String function
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

//String to Int function
func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}


func add(firstNum num1: String,secondNum num2 : String)->Int{
    print("method called")
    return convert(num1) + convert(num2)
}


/////////////////////////////////////////////////////////////////
print("//////Homework1: Build a calculator/////////")
print("Please enter one operator follow by two Int.")
print("For example, add(1,2)")

let inputForHW1 = "add(1,nil)"
var commandArrForHW1 = inputForHW1.componentsSeparatedByCharactersInSet(characters)

var command = ""
var num1 = 0
var num2 = 0

if(commandArrForHW1.count >= 4){
    command = commandArrForHW1.removeFirst()
    num1 = convert(commandArrForHW1[0])
    num2 = convert(commandArrForHW1[1])
}

func mathOp(left : Int, right : Int, op : (Int, Int) -> Int) -> Int {
    return op(left, right)
}

var result = 0
var sign = ""

switch command{
case "add" : result = mathOp(num1, right: num2) { $0 + $1 }; sign = "+"
case "sub" : result = mathOp(num1, right: num2) { $0 - $1 }; sign = "-"
case "mul" : result = mathOp(num1, right: num2) { $0 * $1 }; sign = "x"
case "div" : if(num2 == 0){
    print("Cannot divide by 0" )
    break
}else{
    result = mathOp(num1, right: num2) { $0 / $1 };
    sign = "+"
    }
default: print("Invaild operator input :\(command)")
    break
}

print("\(num1) \(sign) \(num2) = \(result)")

/////////////////////////////////////////////////////////////////
/*
1) add/mul all the int in an array
2) avg/getCount all the int in an array
*/
/////////////////////////////////////////////////////////////////
print("")
print("")
print("///////////Homework2: Array Fun/////////")
print("Please enter an array of operator and two Int. (Without space)")
print("For example, 'add,1,2,3,4'")

let inputForHW2 = input()
var commandArrForHW2 = inputForHW2.componentsSeparatedByCharactersInSet(characters)


if(commandArrForHW2.count >= 2){
    command = commandArrForHW2.removeFirst()
}

var numArr = [Int]()
for num in commandArrForHW2{
    numArr.append(convert(num))
}

var add = numArr.reduce(0) { $0 + $1 }
var mul = numArr.reduce(1) { $0 * $1 }
var avg = numArr.reduce(0) { $0 + $1 } / numArr.count
var count = numArr.count

switch command
{
case "add" : print(add)
case "mul" : print(mul)
case "avg" : print(avg)
case "count" : print(count)
default : print("Please try again!")
}

////////////////////////////////////////////////////////
/*
–use tuples to represent x/y point pairs

–create two functions for adding and subtracting points

(1,2) + (3,4) = (4, 6)
(1,2) - (3,4) = (-2, -2)
–handle dictionaries without "x" or "y" without crashing
–handle dictionaries with Double values without crashing
*/
/////////////////////////////////////////////////////////

print("")
print("")
print("/////////// Homework3: Points/////////")
var firstNum = (6,4)
var secondNum = (8,9)

var numIntDic = [1:3,5:7]
var numDoubleDic = [Double : Double]()

for (key,value) in numIntDic {
    numDoubleDic[(Double)(key)] = (Double)(value)
}


var keyResult : Double = 0
var valResult : Double = 0

func sumTuple (first : (Int,Int), second : (Int,Int))->(Int,Int){
    return ((first.0 + second.0), (first.1 + second.1))
}

func subTuple (first : (Int,Int), second : (Int,Int))->(Int,Int){
    return ((first.0 - second.0), (first.1 - second.1))
}

func sumDict (frist : [Double : Double])->(Int,Int){
    keyResult  = 0
    valResult  = 0
    for (key, value) in frist {
        keyResult += (Double)(key)
        valResult += (Double)(value)
    }
    return ((Int)(keyResult),(Int)(valResult))
}

func subDict (frist : [Double : Double])->(Int,Int){
    keyResult  = 0
    valResult  = 0
    for (key, value) in frist {
        keyResult -= key
        valResult -= value
    }
    return ((Int)(keyResult),(Int)(valResult))
}

print("")
print("")
print("/////Add function(for tuple)//////")
print("First tuple : \(firstNum)")
print("Second tuple : \(secondNum)")
print("Math opreator : + ")
print("Result = \(sumTuple(firstNum , second: secondNum))")
print("")
print("")
print("//////Sub function(for tuple)/////")
print("First tuple : \(firstNum)")
print("Second tuple : \(secondNum)")
print("Math opreator : - ")
print("Result = \(subTuple(firstNum , second: secondNum))")
print("")
print("")
print("///Add fucntion(for Dictionary[Int])///")
print("Input dictionary\(numIntDic)")
print(sumDict(numDoubleDic))
print("")
print("")
print("///Add fucntion(for Dictionary[Double])///")
print("Input dictionary\(numDoubleDic)")
print(sumDict(numDoubleDic))



