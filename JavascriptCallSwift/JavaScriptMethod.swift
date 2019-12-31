//
//  JavaScriptMethod.swift
//  JavascriptCallSwift
//
//  Created by Siang on 2019/12/31.
//  Copyright © 2019 Siang. All rights reserved.
//

import UIKit
import JavaScriptCore

@objc protocol JavaScriptFuncProtocol: JSExport {
    func consloe(_ value: String)
    func goToSecondPage(_ num: Int)
}

class JavaScriptMethod : NSObject, JavaScriptFuncProtocol {
    
    var pageID: ((Int) -> Void)?
    
    func consloe(_ value: String) {
        print("value: \(value)")
    }
    
    func goToSecondPage(_ num: Int) {
        print("pageID: \(num)")
        pageID?(num)
    }

}
