//
//  AppDelegate.swift
//  miniTransForm
//
//  Created by Srinivas Chakravarthi Thandu on 12/7/20.
//  Copyright © 2020 Anju. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    //automatically adjusts length instead of specifying a specified width
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem.button?.title = "📝"
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func showSettings(){
        print("Inside show settings")
        let storyboard = NSStoryboard(name:"Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier:"ViewController")
            as? ViewController else{
                fatalError("Unable to find ViewController in the storyboard")
        }
        
        guard let button = statusItem.button else {
            fatalError("Could'nt find status item button")
        }
        
        let popOverView = NSPopover()
        popOverView.contentViewController = vc
        popOverView.behavior = .transient /// goes away as it it clicked any where
        popOverView.show(relativeTo:button.bounds, of:button,preferredEdge:.maxY)
    }
}

