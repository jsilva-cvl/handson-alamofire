//
//  ViewController.swift
//  howto-alamofire
//
//  Created by José Silva on 14/05/2019.
//  Copyright © 2019 Codavel. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performGETRequest()
        performPOSTRequest()
    }
    
    func performGETRequest() {
        // 1 - create url
        let URL:String = "https://httpbin.org/get"
        
        // 2 - create request
        Alamofire.request(URL,
                          method: .get,
                          parameters: nil)
            .validate()
            .responseJSON { response in
                // 3 - HTTP response handle
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    return
                }
                print("########   GET RESPONSE   ########")
                print(response)
                print()
        }
    }
    
    func performPOSTRequest() {
        // 1 - create url
        let URL:String = "https://httpbin.org/post";
        
        // 2 - create request
        Alamofire.request(URL,
                          method: .post,
                          parameters: ["s":1893])
            .validate()
            .responseJSON { response in
                // 3 - HTTP response handle
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(String(describing: response.result.error))")
                    return
                }
                print("########   POST RESPONSE   ########")
                print(response)
                print()
        }
    }
}
