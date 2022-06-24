//
//  main.swift
//  homeWork 16
//
//  Created by Seroj on 24.06.22.
//

import Foundation

//homeWork 16.1
/*
 Ստեղծել struct Point անունով որը պետք է ունենա 2 init `
 - պետք է սկզբնական արժեքներ տա x, y։ Օրինակ Point(x: 5, y: -8) -> x = 5, y = -8
 - պետք է միայն դրական սկզբնական արժեքներ տա   x, y-ին: Օրինակ Point(x: -5, y: -8) -> x = 5, y = 8
*/
func modul(_ num: Double) -> Double {
    if num < 0 {
       return num * -1
    }
    return num
}

struct Point {
    var x: Double
    var y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    init(x2: Double, y2: Double) {
        self.init(x: abs(x2), y: abs(y2))
    }
    
    init(x3: Double, y3: Double) {
        self.init(x: modul(x3), y: modul(y3))
    }
}

var exemp = Point(x: -4, y: -2)
print(exemp)

var exemp2 = Point(x2: -4, y2: -2)
print(exemp2)

var exemp3 = Point(x3: -2, y3: -3.3)
print(exemp3)

//homeWork 16.2
/*
 Ստեղծել struct Rect (հետևյալ փրոփրտիներով origin: Point, weight: Double, height: Double ) անունով որը պետք է ունենա հետևյալ init-ները`
 - init(origin: Point, weight: Double, height: Double)
 - init(center: Point, weight: Double, height: Double)
 - init(weight: Double, height: Double) -> Point.x = 0 Point.y = 0
 */

struct Rect {
    var origin: Point
    var weight: Double
    var height: Double
    
    var center: Point {
        get {
            let centerX = origin.x + weight / 2
            let centerY = origin.y + height / 2
            return Point(x: centerX, y: centerY)
        }
    }

    init(origin: Point, weight: Double, height: Double) {
        self.origin = origin
        self.weight = weight
        self.height = height
    }

    init(center: Point, weight: Double, height: Double) {
        self.init(origin: center, weight: weight, height: height)
    }

    init(weight: Double, height: Double) {
        self.init(origin: Point(x: 0, y: 0), weight: weight, height: height)
    }
}

var myRect = Rect(origin: Point(x: 1, y: 1), weight: 10, height: 10)
print(myRect)
print(myRect.center)

//homeWork 16.3
/*
 Ստեղծել struct Color (հետևյալ փրոփրտիներով red, green, blue)
 - init(red: Double, green: Double, blue: Double)
 - init(red: Double)
 - init(green: Double)
 - init(blue: Double)
 */
struct Color {
    var red: Double
    var green: Double
    var blue: Double

    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }

    init(red: Double) {
        self.init(red: red, green: 0, blue: 0)
    }

    init(green: Double) {
        self.init(red: 0, green: green, blue: 0)
    }

    init(blue: Double) {
        self.init(red: 0, green: 0, blue: blue)
    }
}

var colorExemp = Color(red: 1, green: 0.5, blue: 1.5)

//homeWork 16.4
/*
 Ստեղծել Class Car անունով (հետևյալ փրոփրտիներով name, model,speed, isAutomatic)  որը պետք է ունենա հետևյալ init-ները`
 - init(name: String, model: String, speed: String, isAutomatic: Bool)
 - init(name: String, model: String, speed: String)
 - init(name: String, model: String)
 - init(name: String)
 - init()
 */
class Car {
    var name: String
    var model: String
    var speed: String
    var isAutomatic: Bool

    init(name: String, model: String, speed: String, isAutomatic: Bool) {
        self.name = name
        self.model = model
        self.speed = speed
        self.isAutomatic = isAutomatic
    }

    convenience init(name: String, model: String, speed: String) {
        self.init(name: name, model: model, speed: speed, isAutomatic: true)
    }

    convenience init(name: String, model: String) {
        self.init(name: name, model: model, speed: "", isAutomatic: true)
    }

    convenience init(name: String) {
        self.init(name: name, model: "", speed: "", isAutomatic: true)
    }

    convenience init() {
        self.init(name: "", model: "", speed: "", isAutomatic: true)
    }
}

var carExemp = Car(name: "Mercedes", model: "C 300", speed: "240 km/h", isAutomatic: true)


//homeWork 16.5
/*
 Ստեղծել Class View անունով (հետևյալ փրոփրտիներով frame: Rect, backgroundColor: Color, tag: Int)
 որը պետք է ունենա հետևյալ init-ները`
 - init(frame: Rect, backgroundColor: Color, tag: Int)
 - init(frame: Rect, backgroundColor: Color)
 - init(frame: Rect)
 - init()
 */
class View {
    var frame: Rect
    var backgroundColor: Color
    var tag: Int

    init(frame: Rect, backgroundColor: Color, tag: Int) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.tag = tag
    }

    convenience init(frame: Rect, backgroundColor: Color) {
        self.init(frame: frame, backgroundColor: backgroundColor, tag: 0)
    }

    convenience init(frame: Rect) {
        self.init(frame: frame, backgroundColor: Color(red: 0, green: 0, blue: 0), tag: 0)
    }

    convenience init() {
        self.init(frame: Rect(origin: Point(x: 0, y: 0), weight: 0, height: 0), backgroundColor: Color(red: 0, green: 0, blue: 0), tag: 0)
    }
}

var viewExemp = View()


//homeWork 16.6
/*
 Ստեղծել Class Button որը կժառանգվի View -ից (հետևյալ փրոփրտիներով titleName: String, isSelected: Bool) որը պետք է ունենա հետևյալ init-ները`
 - init(frame: Rect, titleName: String, isSelected: Bool)
 - init(frame: Rect, titleName: String)
 */
class Button: View {
    var titleName: String
    var isSelected: Bool

    init(titleName: String, isSelected: Bool, frame: Rect) {
        self.titleName = titleName
        self.isSelected = isSelected
        super.init(frame: frame, backgroundColor: Color(red: 0, green: 0, blue: 0), tag: 0)
    }

    convenience init(frame: Rect, titleName: String) {
        self.init(titleName: titleName, isSelected: true, frame: frame)
    }
}

var buttonExemp = Button(frame: Rect(weight: 3, height: 7), titleName: "title")
print(buttonExemp.isSelected)





//
