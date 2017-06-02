//
//  ViewController.swift
//  MiniBrowser
//
//  Created by celia me on 2017. 5. 31..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {
    @IBOutlet var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var mainWebView: UIWebView!
    @IBOutlet var spinningActivityIndicatorView: UIActivityIndicatorView!

    @IBAction func bookMarkAction(_ sender: Any) {
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "https://www.\(bookMarkUrl!).com"
        mainWebView.loadRequest(URLRequest(url:URL(string: urlString)!))
        urlTextField.text = urlString
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        if !urlString.hasPrefix("https://") {
            urlString = "https://www.\(urlString)"
            urlTextField.text = urlString
        }
        mainWebView.loadRequest(URLRequest(url:URL(string: urlString)!))
        textField.resignFirstResponder()
        return true
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        spinningActivityIndicatorView.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinningActivityIndicatorView.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //계속 돌거나 그냥 멈춰있음. loadRequest는 비동기통신이라
        //spinningActivityIndicatorView.startAnimating()
        let urlString = "https://www.facebook.com"
        mainWebView.loadRequest(URLRequest(url:URL(string: urlString)!))
        urlTextField.text = urlString
        //spinningActivityIndicatorView.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

