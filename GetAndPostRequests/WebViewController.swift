//
//  WebViewController.swift
//  GetAndPostRequests
//
//  Created by Сергей Насыбуллин on 07.08.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var selectedCourse: String?
    var courseUrl = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedCourse
        
        guard let url = URL(string: courseUrl) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), context: nil)
        
        
    }
    
    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
    }
    

}
