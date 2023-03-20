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
//        URL(domain: "https://dummyjson.com", path: "auth/login")!
//            .makeRequest(with: .post)
//            .appendingTextField("username", value: "kminchelle")
//            .appendingTextField("password", value: "0lelplR")
//            .withContentType(.json)
//            .decodeOnReceive(for: Login.self)
//            .send {
//                print($0)
//            } success: {
//                print("Welcome, \($0.firstName) \($0.lastName)")
//            }
        
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZjljZmQ4ZTk1MTUxYmUyMjgxMGE4YWE4OTAyMmE3ODhjODUxM2U1NTYwZWM1ZDhhMDgwZmRjNzI2NmZkMGJjOGY4NjYxYmYxZDc5MTg4MDMiLCJpYXQiOjE2NzkyNTQ1NjIuMjAwMTc5MTAwMDM2NjIxMDkzNzUsIm5iZiI6MTY3OTI1NDU2Mi4yMDAxODEwMDczODUyNTM5MDYyNSwiZXhwIjoxNzEwODc2OTYyLjE5ODQ2Nzk2OTg5NDQwOTE3OTY4NzUsInN1YiI6IjE3OSIsInNjb3BlcyI6W119.iHDiqSSbuxQ8GqWbE4gjGECFQL0y-RtNRhgBhATh8UOMVhtw5qspd7AVSh3mt9HnLwg8GMXB5zpyy2_XE58AWlyTSMGFQe69O7wkVN9e8mLRr2A7vYpH_VqoRhKr9Ea8lgheUxEmRFDwpWY5vld1890ZaxmpZJHsot98LsuVbWNa72HlEZr7D0uSdJsUkwp3JtqMZHbyqZMcnNEgAzw-egMqQXAZUf5ZNf4IN3rXH6lZtbngr9_fyi_DorgQY0zdpdPUese3909DBjOrVnCno4rPwGF7Ir9Sh8EaH85pWtuABQokY9QiekNJd8IGOfdmHaNeQRjzPbHe0RWB-LUEibODI_qkPGHfsU5YQUXJfo24E4WIoqJyy133Q0mkgLhWkyil9lgiUOmKBINic_WmOoK9FBEo3ZS6R9ApbOGTLxtcJZ3WGm9-Kkx9-wCS9VoGwyyFFg6JnwOLZQ_cj4ZvswB3so2kzVnRGkqSILXGC7Yl24V-Ohey03hRXjwsIlu07bCwPj6chRsvjRVV7sbkbYUlPb0kj4-OdjGGTyDpFitS77vdrFYeAOjSGA7C_x9b-cifLUfaqGJzRn4e2XS2nWCBaMKt_gHbWWtKIaiMxEua11refQqk-TRNmBw3Ghoq-zPw-_kGzD98LKS6ZkZKCoKlBCloR-nRvKjAOXRInH8"
        
        URL(domain: "https://alarrab.net", path: "api/profile/update")!
            .makeRequest(with: .post)
            .withBearerToken(token)
            .appendingTextField("name", value: "test updated")
            .appendingTextField("email", value: "updated@test.net")
            .appendingDataField("edit_avatar", type: "image/jpeg", value: (UIImage(named: "Image")?.jpegData(compressionQuality: 0.4))!)
            .withContentType(.formData)
            .withAcceptType(.json)
            .decodeJSONOnReceive(for: UpdateModel.self)
            .send {
                print($0)
            } success: {
                print($0)
            }

    }

}

