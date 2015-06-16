//
//  ViewController.swift
//  Shape Calculator
//
//  Created by Rohit S on 3/18/15.
//  Copyright (c) 2015 Rohit. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource {


    @IBOutlet weak var txtBox: UITextField!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var lbl1: UILabel!
    
    let pickerData = ["Square","Circle","Rectangle","Triangle","Cube","Sphere","Cylinder","Cone"]
    
    var selectedShape:String = "Square"
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "Shape Calculator"
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedShape = pickerData[row]
    }
    
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

            let secondViewController = segue.destinationViewController as ShapeCalculationViewController
            secondViewController.shape = selectedShape

    }
    
    

}

