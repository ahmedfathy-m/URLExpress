//
//  ViewController.swift
//  URLExpress
//
//  Created by Ahmed Fathy on 03/18/2023.
//  Copyright (c) 2023 Ahmed Fathy. All rights reserved.
//

import UIKit
import URLExpress

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        URL(domain: "https://dummyjson.com", path: "auth/login")!
            .makeRequest(with: .post)
            .appendingTextField("username", value: "kminchelle")
            .appendingTextField("password", value: "0lelplR")
            .withContentType(.json)
            .decodeOnReceive(for: Login.self)
            .send {
                print($0)
            } success: {
                print("Welcome, \($0.firstName) \($0.lastName)")
            }
    }

}

