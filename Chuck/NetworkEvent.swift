//
//  NetworkEvent.swift
//  Chuck
//
//  Created by Marx, Brian on 3/23/18.
//  Copyright © 2018 Marx, Brian. All rights reserved.
//

import Foundation

struct NetworkEvent {
    var url = ""
    var json = ""
    var name = ""
    var request = ""
    var response = ""
    var code = 0
    var timesCalled = 0
    var children = [NetworkEvent]()
    var parent = ""
}
