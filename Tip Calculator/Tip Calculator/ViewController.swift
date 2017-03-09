//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Annamalai Muthappan on 3/7/17.
//  Copyright © 2017 Annamalai Muthappan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    @IBAction func CalculateTip(_ sender: AnyObject) {
        
        //off switch as user making changes
        UserDefaults.standard.set(false, forKey: "autoAdjust")
      
        let tipPercentages=[0.18,0.2,0.25]
        
        let bill=Double(billField.text!) ?? 0
        let tip=bill*tipPercentages[tipControl.selectedSegmentIndex]
        UserDefaults.standard.set(tipControl.selectedSegmentIndex, forKey: "userSelectedTipIndex")

        let total=bill+tip
        
        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
    }
    
    //setting view animation
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        //let intValue=UserDefaults.standard.integer(forKey:"defaultTipIndex")
let switchStatus=UserDefaults.standard.object(forKey: "autoAdjust") as? Bool
        
        if(switchStatus!){
        tipControl.selectedSegmentIndex=1
        tipControl.sendActions(for: .valueChanged)
        UserDefaults.standard.set(true, forKey: "autoAdjust")
        
    
        }
        else{
            let tipIdx=UserDefaults.standard.integer(forKey:"userSelectedTipIndex")
        tipControl.selectedSegmentIndex=tipIdx
           tipControl.sendActions(for: .valueChanged)

        }
        
        

    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
}

