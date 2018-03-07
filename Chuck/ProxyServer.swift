//
//  ProxyServer.swift
//  Chuck
//
//  Created by Marx, Brian on 2/15/18.
//  Copyright © 2018 Marx, Brian. All rights reserved.
//

import Foundation

class ProxyServer {
    
    var inputStream: InputStream!
    var outputStream: OutputStream!
    var port: Int
    
    init() {
        inputStream = nil
        outputStream = nil
        port = 0
    }
    
    init(input: InputStream, output: OutputStream, portNumber: Int) {
        inputStream = input
        outputStream = output
        port = portNumber
    }
    
    func callRecieved() {
        
    }
    
    
}
