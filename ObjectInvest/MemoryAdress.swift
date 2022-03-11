//
//  MemoryAdress.swift
//  ObjectInvest
//
//  Created by Roger Luo on 2022/3/8.
//

import Foundation

struct MemoryAddress<T>: CustomStringConvertible {

    let intValue: Int

    var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }

    // for structures
    init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

extension MemoryAddress where T: Any {

    // for classes
    init(of classInstance: T) {
        intValue = unsafeBitCast(classInstance, to: Int.self)
        // or(can only be used on instances)      Int(bitPattern: Unmanaged<T>.passUnretained(classInstance).toOpaque())
    }
}

