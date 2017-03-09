//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Annamalai Muthappan on 3/7/17.
//  Copyright © 2017 Annamalai Muthappan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultsSwitch: UISwitch!
      let defaults = UserDefaults.standard
    var autoAdjust=true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //defaultsSwitch.setOn(true, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func test(){
    let defaults = UserDefaults.standard
    defaults.set("$0.00", forKey: "billAmt")
    defaults.set(0, forKey: "tipIndex")
    defaults.synchronize()
       
    }
    
    @IBAction func setDefaults(_ sender: Any) {
        
        if(defaultsSwitch.isOn)
        {
        print("switch on")

       defaults.set(defaultsSwitch.isOn, forKey: "autoAdjust")
            defaults.set(1, forKey: "defaultTipIndex")
            defaults.synchronize()
            

        }
        else
        {
          print("switch off")
         defaults.set(defaultsSwitch.isOn, forKey: "autoAdjust")
            defaults.synchronize()
        

        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
     let status=defaults.object(forKey:"autoAdjust") as? Bool
        
        print(status!)
        defaultsSwitch.isOn=status!
    }

   
}
