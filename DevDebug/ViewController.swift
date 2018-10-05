//
//  ViewController.swift
//  DevDebug
//
//  Created by Kanchan on 03/10/18.
//  Copyright © 2018 Kanchan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    var result : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addNum(_ sender: Any)
    {
        let a = Int(firstNum.text!)
        let b = Int(secondNum.text!)
        result = a! + b!
        let debugPop = devRunDebugEvent.init().initToast(withString: "", fromClass: self)
        self.present(debugPop, animated: true, completion: nil)
    }
}

