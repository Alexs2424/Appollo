//: Playground - noun: a place where people can play

import UIKit
import Foundation

var dictionary:Dictionary = ["Title" : "Concise Writing",
                             "Teacher" : "Ward",
                             "Description" : "This it to make your writing completely smaller without comprising on the original sentence."]

var dictionary1:Dictionary = [ "Title" : "Writing with a Historical Mind",
                               "Teacher" : "Wimmer",
                               "Description" : "Write with fact and opinion, together"]

var dictionary2:Dictionary = ["Title": "Stretch a canvas",
                              "Teacher" : "Grandi",
                              "Description" : "Learn how to strech a canvas so you can start painting."]

var arrayOfDictionaries:Array = [dictionary]//,dictionary1, dictionary2]

//Swift syntax to access a dictionary inside an array
//var object = arrayOfDictionaries[0]["Title"]
//object["Title"]


for object in arrayOfDictionaries {
    var titleForCell = object["Title"]
    var descriptionForCell = object["Description"]
    var teacherInCell = object["Teacher"]
}