//
//  DownloadImageView.swift
//  AleHouse
//
//  Created by Tiago N Dreyer on 12/09/19.
//  Copyright © 2019 Nunes Dreyer, Tiago. All rights reserved.
//
import Foundation

import UIKit

class DownloadImageView: UIImageView {
    var progress: UIActivityIndicatorView!
    var downloadTask: URLSessionDataTask?
    let downloadQueue = OperationQueue()
    let mainQueue = OperationQueue.main
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createProgress()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createProgress()
    }
    
    func createProgress() {
        progress = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        addSubview(progress)
    }
    
    override func layoutSubviews()  {
        progress.center = convert(self.center , from:self.superview)
    }
    
    func setUrl(_ url: String) {
        setUrl(url, cache: true)
    }
    
    func setUrl(_ url: String, cache: Bool) {
        self.image = nil
        downloadQueue.cancelAllOperations()
        progress.startAnimating()
        downloadQueue.addOperation( { self.downloadImg(url, cache: true) } )
    }
    
    func setUrl(_ url: String, cache: Bool, showProgress: Bool) {
        self.image = nil
        downloadQueue.cancelAllOperations()
        if showProgress {
            progress.startAnimating()
        }
        downloadQueue.addOperation( { self.downloadImg(url, cache: true) } )
    }
    
    func cancelDownload() {
        downloadTask?.cancel()
    }
    
    private func downloadImg(_ url: String, cache: Bool = true) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let urlCache = URLCache.shared
        if let data = urlCache.cachedResponse(for: request)?.data, let image = UIImage(data: data), cache  {
            DispatchQueue.main.async {
                self.image = image
                self.progress.stopAnimating()
            }
        } else {
            downloadTask = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, _) in
                if let data = data, let response = response, let image = UIImage(data: data) {
                    urlCache.storeCachedResponse(CachedURLResponse(response: response, data: data), for: request)
                    DispatchQueue.main.async {
                        self?.image = image
                        self?.progress.stopAnimating()
                    }
                }
            })
            downloadTask?.resume()
        }
    }
    
    func showImg(_ data: Data) {
        if(data.count > 0) {
            self.image = UIImage(data: data)
        }
        progress.stopAnimating()
    }
}
