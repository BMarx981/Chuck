//
//  ViewController.swift
//  Chuck
//
//  Created by Marx, Brian on 2/14/18.
//  Copyright © 2018 Marx, Brian. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController, NSTextFieldDelegate, NSTextViewDelegate, ProxyServerDelegate {
    
    @IBOutlet weak var recordButton: NSButtonCell!
    @IBOutlet weak var saveButton: NSButton!
    @IBOutlet weak var portTextfield: NSTextFieldCell!

    var calls = [NetworkEvent]()
    
    var server = ProxyServer()

    @IBOutlet var text: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        text.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textDidChange(_ notification: Notification) {
        saveButton.isEnabled = true
    }

    override var representedObject: Any? {
        didSet {
            if let portNum = portTextfield?.stringValue {
                server.port = Int(portNum)!
            }
        }
    }

    @IBAction func clearButton(_ sender: NSButton) {
        text?.string = ""
        saveButton.isEnabled = false
    }
    
    @IBAction func recordPressed(_ sender: NSButtonCell) {
        switch sender.title {
        case "Record":
            server.openStream()
            sender.title = "Recording..."
            if let mutableAttributedTitle = sender.attributedTitle.mutableCopy() as? NSMutableAttributedString {
                mutableAttributedTitle.addAttribute(.foregroundColor, value: NSColor.red, range: NSRange(location: 0, length: mutableAttributedTitle.length))
                sender.attributedTitle = mutableAttributedTitle
            }
        case "Recording...":
            server.closeStream()
            sender.title = "Record"
            if let mutableAttributedTitle = sender.attributedTitle.mutableCopy() as? NSMutableAttributedString {
                mutableAttributedTitle.addAttribute(.foregroundColor, value: NSColor.black, range: NSRange(location: 0, length: mutableAttributedTitle.length))
                sender.attributedTitle = mutableAttributedTitle
            }
        default:
            return
        }
    }
    
    @IBAction func saveButtonClicked(_ sender: NSButton) {
        
        saveButton.isEnabled = false
    }
    
    func portNumberDidUpdate(_ controller: ProxyServer, portNumber: Int) {
        controller.port = portNumber
    }
    
}

// MARK: - NSOutlineViewDataSource
extension MainViewController: NSOutlineViewDataSource {
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let networkCall = item as? NetworkEvent {
            return networkCall.children.count
        }
        return calls.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let networkCall = item as? NetworkEvent {
            return networkCall.children[index]
        }
        return calls.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let networkCall = item as? NetworkEvent {
            return networkCall.children.count > 0
        }
        return false
    }
    
}

// MARK: - NSOutlineViewDelegate
extension MainViewController: NSOutlineViewDelegate {
    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard let outlineView = notification.object as? NSOutlineView else {return}
        
        let selectedIndex = outlineView.selectedRow
        if let eventItem = outlineView.item(atRow: selectedIndex) as? NetworkEvent {
            
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?
        
        if (tableColumn?.identifier)!.rawValue == "EventList" {
            if let event = item as? NetworkEvent {
                view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "NetworkCell"), owner: self) as? NSTableCellView
                if let textField = view?.textField {
                    textField.stringValue = event.name
                }
            }
        }
        
        
        return view
    }
    
    
}

