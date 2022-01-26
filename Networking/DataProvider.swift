//
//  DataProvider.swift
//  Networking
//
//  Created by Maxim Mitin on 26.01.22.
//  Copyright © 2022 Alexey Efimov. All rights reserved.
//

import UIKit

class DataProvider: NSObject {
    
    private var downloadTask: URLSessionDownloadTask!
    private lazy var bgSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "ru.swiftbook.Networking")
//        config.isDiscretionary = true
        config.sessionSendsLaunchEvents = true
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()

}


extension DataProvider: URLSessionDelegate {
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                  let completionHandler = appDelegate.bgSessionCompletionHandler else {return}
            
            appDelegate.bgSessionCompletionHandler = nil
            completionHandler()
        }
    }
}
