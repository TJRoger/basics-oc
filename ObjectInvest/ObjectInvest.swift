//
//  ObjectInvest.swift
//  Advanced iOS
//
//  Created by Roger Luo on 2022/3/5.
//

import Foundation

class Person: NSObject {
    var name: String = ""
    var age: Int = 0
    var height: Int = 0
}

class Student: Person {
    var `class`: String = "class01"
}

class ObjectInvest: NSObject {
    fileprivate func objectSize() {
        let instanceSize = class_getInstanceSize(NSObject.self)
        // 8
        print("instance size", instanceSize)
        let obj = NSObject()
        let layout = MemoryLayout.size(ofValue: obj)
        // 8
        print("memory layout", layout)
        let mallocSize = malloc_size(Unmanaged.passUnretained(obj).toOpaque())
        // 16
        print("malloc size", mallocSize)
    }
    
    @objc func run() {
        objectClass()

//        obj
    }
    
    fileprivate func inspectISA(obj1: Any, obj2: Any, desc: String = "super class object:") -> (AnyClass, AnyClass) {
        guard let obj1Class = object_getClass(obj1),
              let obj2Class = object_getClass(obj2) else {
            fatalError("can not get object class")
        }
        print(desc,
              MemoryAddress(of: obj1Class),
              MemoryAddress(of: obj2Class))
        print(class_isMetaClass(obj1Class),
              class_isMetaClass(obj2Class))
        return (obj1Class, obj2Class)
    }
    
    func objectClass() {
//        let obj1 = NSObject()
//        let obj2 = NSObject()
        let obj1 = Student()
        let obj2 = Person()
        print(MemoryAddress(of: obj1),
              MemoryAddress(of: obj2))
        print(String(format:"instance obj1 - %p, obj2 - %p", obj1, obj2))

        // fail
//        print("class obj1 - \(obj1Class), obj2 - \(obj2Class)")
        let obj1Class: AnyClass, obj2Class: AnyClass
        (obj1Class, obj2Class) = inspectISA(obj1: obj1, obj2: obj2, desc: "class object:")
        let obj1MetaClass: AnyClass, obj2MetaClass: AnyClass
        (obj1MetaClass, obj2MetaClass) = inspectISA(obj1: obj1Class, obj2: obj2Class, desc: "meta class object:")
        
        _ = inspectISA(obj1: obj1MetaClass, obj2: obj2MetaClass)
    }
}
