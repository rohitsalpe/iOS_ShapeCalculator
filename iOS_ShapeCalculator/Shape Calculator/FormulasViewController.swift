//
//  FormulasViewController.swift
//  Shape Calculator
//
//  Created by Rohit S on 3/28/15.
//  Copyright (c) 2015 Rohit. All rights reserved.
//

import UIKit

class FormulasViewController: UIViewController {

    var selectedShape:String?
    
    @IBOutlet weak var lblVolPerimeterFormula: UILabel!
    @IBOutlet weak var lblAreaFormula: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
                self.navigationItem.title = "Formulas"
        
                let defaults = NSUserDefaults.standardUserDefaults()
                selectedShape = defaults.objectForKey("SHAPE") as? String
        
        println("Formulas = \(selectedShape!)")
        
        
        switch (selectedShape!)
        {
        case "Square":
            println("Square")
            lblAreaFormula.text = "Area of \(selectedShape!) = Side * Side"
            lblVolPerimeterFormula.text = "Perimeter of \(selectedShape!) = 4 * Side"
        case "Circle":
            println("Circle")
            lblAreaFormula.text = "Area of \(selectedShape!) = 3.14 * radius * radius"
            lblVolPerimeterFormula.text = "Perimeter of \(selectedShape!) = 2 * 3.14 * radius"
            
        case "Cube" :
             println("Cube")
             lblAreaFormula.text = "Area of \(selectedShape!) = 6 * Side"
             lblVolPerimeterFormula.text = "Volume of \(selectedShape!) = Side * Side * Side"
            
        case "Rectangle":
            println("Rectangle")
            lblAreaFormula.text = "Area of \(selectedShape!) = Length * Breadth"
            lblVolPerimeterFormula.text = "Perimeter of \(selectedShape!) = 2 * Length + 2 * Breadth"
            
        case "Triangle":
            println("Triangle")
            lblAreaFormula.text = "Area of \(selectedShape!) = (Base * Height) / 2";
            lblVolPerimeterFormula.hidden = true
            
        case "Sphere":
            println("Sphere")
            lblAreaFormula.text = "Area of \(selectedShape!) = 4 * 3.14 * radius * radius "
            lblVolPerimeterFormula.text = "Volume of \(selectedShape!) = (4 * 3.14 * radius * radius * radius) / 3"
            
        case "Cylinder":
            println("Cylinder")
            lblAreaFormula.text = "Area of \(selectedShape!) = (6.28 * radius^2)+(6.28 * radius * height)"
            lblVolPerimeterFormula.text = "Volume of \(selectedShape!) = 3.14 * radius * radius * height"
            
        case "Cone":
             println("Cone")
             lblAreaFormula.text = "Area of \(selectedShape!) = 3.14 * radius * height"
             lblVolPerimeterFormula.text = "Volume of \(selectedShape!) = (3.14 * radius * radius * height) / 3"
            
        default:
            println("Something else")
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
