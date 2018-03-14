//
//  ViewController.swift
//  Chuck
//
//  Created by Marx, Brian on 2/14/18.
//  Copyright © 2018 Marx, Brian. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController, NSTextFieldDelegate {

    @IBOutlet weak var portTextfield: NSTextFieldCell!

    var server = ProxyServer()

    @IBOutlet var textArea: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
            server.port = Int((portTextfield?.placeholderString)!)!
            
        }
    }

    @IBAction func clearButton(_ sender: NSButton) {
        
    }
    @IBAction func recordButton(_ sender: NSButton) {
        
    }
    @IBAction func editButton(_ sender: NSButton) {
        
    }
    

}

