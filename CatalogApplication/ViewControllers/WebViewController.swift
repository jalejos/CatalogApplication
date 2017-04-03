//
//  WebViewController.swift
//  CatalogApplication
//
//  Created by Alejos on 3/28/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    var url: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = url {
            webView.loadRequest(URLRequest.init(url: url))
        }
    }
}
