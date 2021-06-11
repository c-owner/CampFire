//
//  ViewController.swift
//  campfire
//
//  Created by 천기훈 on 2021/06/11.
//

import UIKit
import SafariServices
//import WebKit

class ViewController: UIViewController {

//    @IBOutlet var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        webview.load(URLRequest(url: URL(string: "http://camp-fire.kro.kr")!))
        
        
    }

    @IBAction func buttonTapped(){

//        let vc = SFSafariViewController(url: URL(string: "http://camp-fire.kro.kr")!)
        let vc = SFSafariViewController(url: URL(string: "http://camp-fire.kro.kr")!)
        present(vc, animated: true)
    }

    
}

