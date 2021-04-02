//
//  devRunDebugEvent.swift
//  CreatedApp
//
//  Created by Kanchan on 27/09/18.
//

import UIKit

class devRunDebugEvent: NSObject {

      var pop1 : UIAlertController?

    public  func initToast(withString : String, fromClass : Any) -> UIAlertController {
        var paraList = ""
        var i = 1
        for strname in Mirror(reflecting: fromClass).children.compactMap({ $0.label }) {
            paraList = ("\(paraList) \n \(i). \(strname)")
            i = i + 1
        }
        pop1 = UIAlertController.init(title: "Select number to see its value",
                                      message: paraList.description, preferredStyle: UIAlertControllerStyle.alert)
        pop1?.addTextField(configurationHandler:{ (textField) in
            textField.placeholder = "Enter option number"
            textField.keyboardType = UIKeyboardType.numberPad
        })
        
        let actOK = UIAlertAction.init(title: "Done", style: UIAlertActionStyle.default) { (act) in
            print("option revieved ",self.pop1?.textFields?.first?.text as Any)
            var ind = 0
            let memberVars = Mirror(reflecting: fromClass).children
            if let indexVal = Int((self.pop1?.textFields?.first?.text)!) {
                ind = indexVal - 1
                if memberVars.count <= ind {return}
            }else { return}
            let pop2 = UIAlertController.init(title: "Value",
                                              message: (memberVars.compactMap { $0.value }[ind] as AnyObject).description ,
                                              preferredStyle: UIAlertControllerStyle.alert)
            let act = UIAlertAction.init(title: "Close",
                                         style: UIAlertActionStyle.default,
                                         handler: nil)
            let retake = UIAlertAction.init(title: "Retry",
                                            style: UIAlertActionStyle.default,
                                            handler: { (act) in
                (fromClass as! UIViewController).present(self.pop1!, animated: true, completion: nil)
            })
            pop2.addAction(act)
            pop2.addAction(retake)
            (fromClass as! UIViewController).present(pop2, animated: true, completion: nil)
        }
        pop1?.addAction(actOK)
        return pop1!
    }
  
    override init()
    {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
