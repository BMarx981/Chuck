//
//  ViewController.swift
//  Chuck
//
//  Created by Marx, Brian on 2/14/18.
//  Copyright © 2018 Marx, Brian. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {

    var server = ProxyServer()

    @IBOutlet var textArea: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func clearButton(_ sender: NSButton) {
        
    }
    @IBAction func recordButton(_ sender: NSButton) {
        
    }
    @IBAction func editButton(_ sender: NSButton) {
        
    }

}

