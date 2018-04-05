//
//  WebViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 04/04/18.
//  Copyright © 2018 EricBrito. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var url: String!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webpageURL = URL(string: url)
        let request = URLRequest(url: webpageURL!)
        webView.loadRequest(request)
    }

    @IBAction func runJS(_ sender: UIBarButtonItem) {
        webView.stringByEvaluatingJavaScript(from: "alert('Rodando Javascript na WebView')")
    }
}

extension WebViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loading.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        print(request.url!.absoluteString)
        
        if request.url!.absoluteString.range(of: "facebook") != nil {
            return false
        }
        
        return true
    }
}
