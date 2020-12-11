//
//  ViewController.swift
//  miniTransForm
//
//  Created by Srinivas Chakravarthi Thandu on 12/7/20.
//  Copyright © 2020 Anju. All rights reserved.
//

import Cocoa

class ViewController: NSViewController,NSTextFieldDelegate {

   
    @IBOutlet var input: NSTextField!
    @IBOutlet var type: NSSegmentedControl!
    @IBOutlet var output: NSTextField!
    let ZalgoCharacters = zalgoCharacters()
    override func viewDidLoad() {
        super.viewDidLoad()
        typeChanged(self);
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

 
    @IBAction func typeChanged(_ sender: Any) {
        switch(type.selectedSegment){
        case 0:
            output.stringValue = rock13(input.stringValue)
        case 1:
            output.stringValue = similar(input.stringValue)
        case 2:
            output.stringValue = strike(input.stringValue)
        default:
            output.stringValue = zalgo(input.stringValue)
            
        }
    }
    
    
    @IBAction func copyAction(_ sender: Any) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(output.stringValue, forType:.string)
    }
    
    func controlTextDidChange(_ obj:Notification){
        typeChanged(self)
    }
    func rock13(_ input:String)->String {
        //oyhr obl
        return ROT13.string(input)
    }
    
    func similar(_ input:String)->String {
        var output = input //ª☯︎☓s☦︎f created result
        output = output.replacingOccurrences(of: "a", with: "ª")
        output = output.replacingOccurrences(of: "c", with: "☪︎")
         output = output.replacingOccurrences(of: "o", with: "☯︎")
         output = output.replacingOccurrences(of: "x", with: "☓")
        output = output.replacingOccurrences(of: "t", with: "☦︎")
        
        
        
        return output;
    }
    
    func strike(_ input:String)->String {
        var output = ""
        for letter in input{
            output.append(letter)
            output.append("\u{0335}")
        }
        return output;
    }
    
    func zalgo(_ input:String)->String {
        var output = ""
        for letter in input{
            output.append(letter)
        
        //h͕̓͛̊͟j̴̧͈̜͕͚̰̬̇̈́́h̍͗̿̚҉̛̜͚̜̬̤͢j̧̭͍͍̠̿̍̊̄́̂̀͟h̸͕͖̥̝͛̈ͯ͌ͤ̏́̚͢͢j͎̠̰̖͇̍ͫ̊ͧͥ̏̈́̕ͅh͙̙͎̟͉̫̆ͪͩ͆̏̓̈͘͘ͅjͫ̀̽͌͌҉҉̗̥̪̠͍̖̻ḥ̠̯ͯ̎̔̿̚͠͡͡j̃̈ͦͦͬͣ́҉̷̼̱̺̭͍͕͢
        for _ in 1...Int.random(in: 1...8){
            output.append(ZalgoCharacters.above.randomElement())
        }
        for _ in 1...Int.random(in: 1...3){
            output.append(ZalgoCharacters.inline.randomElement())
        }
        for _ in 1...Int.random(in: 1...8){
            output.append(ZalgoCharacters.below.randomElement())
        }
        }
        return output;
    }
}

extension String{
    mutating func append(_ str:String?){
        guard let str = str else{return}
        append(str)
    }
}

