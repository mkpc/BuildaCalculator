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

let inputCommand = input()
let commandArr = inputCommand.componentsSeparatedByCharactersInSet(characters)

var command = ""
var num1 = ""
var num2 = ""

if(commandArr.count >= 4){
    command = commandArr[0]
    num1 = commandArr[1]
    num2 = commandArr[2]
}

switch command{
case "add" : print("Result = \(convert(num1) + convert(num2))")
case "sub" : print("Result = \(convert(num1) - convert(num2))")
case "mul" : print("Result = \(convert(num1) * convert(num2))")
case "div" : if(num2=="0"){
    print("Cannot divide by 0" )
    break
}else{
    print("Result = \(convert(num1) / convert(num2))")
    
    }
default: print("Invaild operator input :\(command)")
    break
}








