//
//  devRunDebugEvent.swift
//  CreatedApp
//
//  Created by Kanchan on 27/09/18.
//

import UIKit

class devRunDebugEvent: NSObject {

      var pop1 : UIAlertController?
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
    public  func initToast(withString : String, fromClass : Any) -> UIAlertController
    {
        //print("strings recieved ",withString," from class",fromClass)
      
        var paraList = ""
        var i = 1
        for strname in Mirror(reflecting: fromClass).children.flatMap({ $0.label }) {
            paraList = ("\(paraList) \n \(i). \(strname)")
            i = i + 1
        }
        pop1 = UIAlertController.init(title: "Select number to see its value", message: paraList.description, preferredStyle: UIAlertControllerStyle.alert)
        pop1?.addTextField(configurationHandler:{ (textField) in
            textField.placeholder = "Enter option number"
            textField.keyboardType = UIKeyboardType.numberPad
        })
        
        let actOK = UIAlertAction.init(title: "Done", style: UIAlertActionStyle.default) { (act) in
            print("option revieved ",self.pop1?.textFields?.first?.text as Any)
            var ind = 0
            if let indexVal = Int((self.pop1?.textFields?.first?.text)!){
                ind = indexVal - 1
            }else{
                return
            }
            // print("value of option revieved ",(Mirror(reflecting: fromClass).children.flatMap { $0.value })[indexVal!] )
            let pop2 = UIAlertController.init(title: "Value", message:(Mirror(reflecting: fromClass).children.flatMap { $0.value }[ind] as AnyObject).description , preferredStyle: UIAlertControllerStyle.alert)
            let act = UIAlertAction.init(title: "close", style: UIAlertActionStyle.default, handler: nil)
            let retake = UIAlertAction.init(title: "Retry", style: UIAlertActionStyle.default, handler: { (act) in
                (fromClass as! UIViewController).present(self.pop1!, animated: true, completion: nil)
            })
            pop2.addAction(act)
            pop2.addAction(retake)
            (fromClass as! UIViewController).present(pop2, animated: true, completion: nil)
            //self.present(pop2)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
