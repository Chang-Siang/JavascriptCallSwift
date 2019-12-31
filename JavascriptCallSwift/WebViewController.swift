//
//  ViewController.swift
//  JavascriptCallSwift
//
//  Created by Siang on 2019/12/31.
//  Copyright © 2019 Siang. All rights reserved.
//

import UIKit
import JavaScriptCore

class WebViewController: UIViewController {
    
    @IBOutlet weak var WebView: UIWebView!
    // import NSObject
    let JavaScript = JavaScriptMethod()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadURL()
        
    }
    
    private func loadURL() {
        // Set WebView Url
        let path = Bundle.main.path(forResource: "SwiftUseJavaScriptDemo", ofType: "html")
        let htmlStr: String = try! String(contentsOfFile: path!)
        
        // Load WebView
        self.WebView.loadHTMLString(htmlStr, baseURL: nil)
        
        // Connect JS & Swift function(only JS > Swift)
        let jsContext = self.WebView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
        jsContext?.setObject(JavaScript, forKeyedSubscript: "javaScriptCallToSwift" as (NSCopying & NSObjectProtocol))
        
        // JavaScript Call Swift action
        JavaScript.pageID = { num in
            self.presentToSecondPage(pageID: num)
        }
        
    }
    
    func presentToSecondPage(pageID: Int){
        DispatchQueue.main.async { // Correct
            print("pageID: \(pageID)")
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            self.present(secondViewController, animated: true, completion: nil)
        }
        
        
    }
    
}

