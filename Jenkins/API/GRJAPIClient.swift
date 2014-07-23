//
//  GRJAPIClient.swift
//  Jenkins
//
//  Created by Garrett Richards on 7/22/14.
//  Copyright (c) 2014 garrett richards. All rights reserved.
//

import UIKit


typealias apiClientHandler = ()->()

class GRJenkinsAPIClient: NSObject {

    init() {
    }
    
    func getProjectList(complete:apiClientHandler?){
        let url = NSURL(string:"http://www.google.com")
        let req = NSURLRequest(URL:url)
        var client = GRJComm(request:req)
        client.setCustomHandler({ (resp, error, responseObj) in
            println("handler executed")
            println("responseObj: \(responseObj)")
            var err =  error?.localizedDescription
            println("code: \(resp?.statusCode) error: \(err)")
        })
        client.start()
    }
}
