//
//  ViewController.swift
//  HcdSpecialField
//
//  Created by Jvaeyhcd on 09/05/2017.
//  Copyright © 2017 Jvaeyhcd. All rights reserved.
//

import UIKit
import HcdSpecialField

class ViewController: UIViewController {

    @IBOutlet weak var specialField: HcdSpecialField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.specialField.frame = CGRect(x: 0, y: 100, width: 320, height: 60)
        self.view.addSubview(self.specialField)
        
        specialField.addTarget(self, action: #selector(ViewController.passcodeFieldDidChangeValue), for: .valueChanged)
    }
    
    @IBAction func passcodeFieldDidChangeValue() {
        print(specialField.inputNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

