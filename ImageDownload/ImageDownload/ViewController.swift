//
//  ViewController.swift
//  ImageDownload
//
//  Created by celia me on 2017. 6. 4..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class ViewController: UIViewController,URLSessionDownloadDelegate {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var progressView: UIProgressView!
    
    // URLSession
    
    var downloadTask:URLSessionDownloadTask!
    
    @IBAction func downloadAction(_ sender: Any) {
        self.imgView.image = nil
        progressView.setProgress(0.0, animated: false)
        indicator.startAnimating()
        let sessionConfiguration = URLSessionConfiguration.default
        let session  = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
        downloadTask =  session.downloadTask(with: URL(string:"https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
        downloadTask.resume() // 실행
    }
    
    // 진행률 확인
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        //print("bytesWritten:\(bytesWritten)")
        //print("totalBytesWritten:\(totalBytesWritten)") // 받은 용량
        //print("totalBytesExpectedToWrite:\(totalBytesExpectedToWrite)") //전체 용량
        let tempProgress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        progressView.setProgress(tempProgress, animated: true)
    }
    
    // 다운로드 완료
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {

        let tempData:Data = try! Data(contentsOf:location)
        self.imgView.image = UIImage(data:tempData)
        indicator.stopAnimating()
    }

    @IBAction func suspendAction(_ sender: Any) {
        downloadTask.suspend()
    }
    @IBAction func resumeAction(_ sender: Any) {
        downloadTask.resume()
    }
    @IBAction func cancelAction(_ sender: Any) {
        downloadTask.cancel()
        progressView.setProgress(0.0, animated: false)
        indicator.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

