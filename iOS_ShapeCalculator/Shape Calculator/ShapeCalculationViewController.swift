//
//  ShapeCalculationViewController.swift
//  Shape Calculator
//
//  Created by Rohit S on 3/28/15.
//  Copyright (c) 2015 Rohit. All rights reserved.
//

import UIKit

class ShapeCalculationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var lblParameter1: UILabel!
    @IBOutlet weak var lblParameter2: UILabel!
    @IBOutlet weak var lblParameter3: UILabel!

    @IBOutlet weak var txtParameter1: UITextField!
    @IBOutlet weak var txtParameter2: UITextField!
    @IBOutlet weak var txtParameter3: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var btnArea:UIButton!
    @IBOutlet weak var btnAreaTriangle: UIButton!
    @IBOutlet weak var btnPerimeterVol: UIButton!



    var shape:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = shape!
        
        var imageViewObject :UIImageView
        
        
       
        
        println("Selected Shape = \(shape!)")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(shape!, forKey: "SHAPE")

        var navigationBarButton = UIBarButtonItem(title: "Formula", style: .Plain, target: self, action: Selector("ToFormulasView"))
        self.navigationItem.rightBarButtonItem = navigationBarButton
        
        self.txtParameter1.delegate = self
        self.txtParameter2.delegate = self
        
        lblResult.hidden  = true
        lblParameter2.hidden = true
        lblParameter3.hidden = true
        
        txtParameter2.hidden = true
        txtParameter3.hidden = true
        
        switch (shape!)
        {
        case "Square":
                println("Square")
                lblParameter1.text = "Enter Side = "
                imageViewObject = UIImageView(frame:CGRectMake(90, 60, 140, 140));
                imageViewObject.image = UIImage(named:"Square.png")
                self.view.addSubview(imageViewObject)

            
        case "Circle":
                println("Circle")
                lblParameter1.text = "Enter Radius = "
                imageViewObject = UIImageView(frame:CGRectMake(80, 60, 175, 140));
                imageViewObject.image = UIImage(named:"Circle.jpg")
                self.view.addSubview(imageViewObject)
        
        case "Cube" :
                lblParameter1.text = "Enter Side = "
                btnPerimeterVol.setTitle("Volume", forState: UIControlState.Normal)
                imageViewObject = UIImageView(frame:CGRectMake(90, 78, 160, 100));
                imageViewObject.image = UIImage(named:"Cube.png")
                self.view.addSubview(imageViewObject)
            
        case "Rectangle":
             println("Rectangle")
             lblParameter1.text = "Enter Length = "
             lblParameter2.hidden  = false
             txtParameter2.hidden  = false
             lblParameter2.text = "Enter Breadth = "
             imageViewObject = UIImageView(frame:CGRectMake(90, 78, 160, 100));
             imageViewObject.image = UIImage(named:"Rectangle.png")
             self.view.addSubview(imageViewObject)
            

            
        case "Triangle":
            println("Triangle")
            
            btnArea.hidden = true
            btnAreaTriangle.hidden = false
            
            btnPerimeterVol.hidden = true
            lblParameter1.text = "Enter Base = "
            lblParameter2.hidden  = false
            txtParameter2.hidden  = false
            lblParameter2.text = "Enter Height = "
            imageViewObject = UIImageView(frame:CGRectMake(90, 78, 160, 100));
            imageViewObject.image = UIImage(named:"Triangle.jpg")
            self.view.addSubview(imageViewObject)

        case "Sphere":
            println("Sphere")
            lblParameter1.text = "Enter Radius = "
            btnPerimeterVol.setTitle("Volume", forState: UIControlState.Normal)
            imageViewObject = UIImageView(frame:CGRectMake(70, 65, 160, 140));
            imageViewObject.image = UIImage(named:"Sphere.png")
            self.view.addSubview(imageViewObject)
            
        case "Cylinder":
            println("Cylinder")
            btnPerimeterVol.setTitle("Volume", forState: UIControlState.Normal)
            lblParameter1.text = "Enter Radius = "
            lblParameter2.hidden  = false
            txtParameter2.hidden  = false
            lblParameter2.text = "Enter Height = "
            imageViewObject = UIImageView(frame:CGRectMake(80, 65, 160, 140));
            imageViewObject.image = UIImage(named:"Cylinder.png")
            self.view.addSubview(imageViewObject)
            
        case "Cone":
            println("Cone")
            btnPerimeterVol.setTitle("Volume", forState: UIControlState.Normal)
            lblParameter1.text = "Enter Radius = "
            lblParameter2.hidden  = false
            txtParameter2.hidden  = false
            lblParameter2.text = "Enter Height = "
            imageViewObject = UIImageView(frame:CGRectMake(80, 65, 160, 140));
            imageViewObject.image = UIImage(named:"Cone.jpg")
            self.view.addSubview(imageViewObject)
            
        default:
            println("Something else")
        }
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ToFormulasView()
    {
            let formulasVC:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FormulasViewController") as UIViewController
        
            var navigationControllerFormulasVC = UINavigationController(rootViewController: formulasVC);
            navigationController?.pushViewController(formulasVC, animated: true )
 }

    
    @IBAction func btnArea(sender: AnyObject) {
        
        lblResult.hidden  = false
        
        switch (shape!)
        {
        case "Square":
              println("Square")
            if (isDouble(txtParameter1.text) && txtParameter1.text != "")
            {
               var side =  (txtParameter1.text as NSString).floatValue
               var area = side * side;
               lblResult.text = "Area = \(area)";
            }
            else
            {

                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                 
                lblResult.text = "Please enter valid value"
            }
          
        case "Circle":
            println("Circle")
            if (isDouble(txtParameter1.text) && txtParameter1.text != "")
            {
                var radius =  (txtParameter1.text as NSString).floatValue
                var area = 3.14 * radius * radius;
                lblResult.text = "Area = \(area) ";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        case "Cube" :
            lblParameter1.text = "Enter Side = "
            btnPerimeterVol.setTitle("Volume", forState: UIControlState.Normal)
            if (isDouble(txtParameter1.text) && txtParameter1.text != "")
            {
                var side =  (txtParameter1.text as NSString).floatValue
                var area = 6 * side;
                lblResult.text = "Area = \(area)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        case "Rectangle":
            println("Rectangle")
            if (isDouble(txtParameter1.text!) && txtParameter1.text != "") && (isDouble(txtParameter2.text!) && txtParameter2.text != "")            {
                var Length = (txtParameter1.text as NSString).floatValue
                var Breadth = (txtParameter2.text as NSString).floatValue
                var area = Length * Breadth;
                lblResult.text = "Area = \(area)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        case "Triangle":
            println("Triangle")
            if (isDouble(txtParameter1.text!) && txtParameter1.text != "") && (isDouble(txtParameter2.text!) && txtParameter2.text != "")            {
                var Base = (txtParameter1.text as NSString).floatValue
                var Height = (txtParameter2.text as NSString).floatValue
                var area = (Base * Height) / 2;
                lblResult.text = "Area = \(area)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        case "Sphere":
            println("Sphere")
            btnPerimeterVol.setTitle("Volume", forState: UIControlState.Normal)
            if (isDouble(txtParameter1.text) && txtParameter1.text != "")
            {
                var radius =  (txtParameter1.text as NSString).floatValue
                var area = 4 * 3.14 * radius * radius ;
                lblResult.text = "Area = \(area)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        case "Cylinder":
            println("Cylinder")
            if (isDouble(txtParameter1.text!) && txtParameter1.text != "") && (isDouble(txtParameter2.text!) && txtParameter2.text != "")            {
                var radius = (txtParameter1.text as NSString).floatValue
                var height = (txtParameter2.text as NSString).floatValue
                var area = (2 * 3.14 * radius * radius) + 2 * 3.14 * radius * height
                lblResult.text = "Area = \(area)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        case "Cone":
            println("Cone")
            if (isDouble(txtParameter1.text!) && txtParameter1.text != "") && (isDouble(txtParameter2.text!) && txtParameter2.text != "")            {
                var radius = (txtParameter1.text as NSString).floatValue
                var height = (txtParameter2.text as NSString).floatValue
                var area =  3.14 * radius * height
                lblResult.text = "Area = \(area)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        default:
            println("Something else")
        }
        
    }
    
    
    @IBAction func btnPerimeterVol(sender: AnyObject) {
        
        lblResult.hidden  = false
        
        switch (shape!)
        {
        case "Square":
            println("Square")
            if (isDouble(txtParameter1.text) && txtParameter1.text != "")
            {
                var side =  (txtParameter1.text as NSString).floatValue
                var perimeter = 4 * side;
                lblResult.text = "Perimeter = \(perimeter)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
            
        case "Circle":
            println("Circle")
            if (isDouble(txtParameter1.text) && txtParameter1.text != "")
            {
                var radius =  (txtParameter1.text as NSString).floatValue
                var perimeter = 2 * 3.14 * radius;
                lblResult.text = "Perimeter = \(perimeter)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            

        case "Cube" :
            lblParameter1.text = "Enter Side = "
            btnPerimeterVol.setTitle("Volume", forState: UIControlState.Normal)
            lblResult.text = "Volume = "
            if (isDouble(txtParameter1.text) && txtParameter1.text != "")
            {
                var side =  (txtParameter1.text as NSString).floatValue
                var perimeter = side * side * side;
                lblResult.text = "Volume = \(perimeter)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        case "Rectangle":
            println("Rectangle")
            if (isDouble(txtParameter1.text) && txtParameter1.text != "") && (isDouble(txtParameter2.text) && txtParameter2.text != "")            {
                var Length = (txtParameter1.text as NSString).floatValue
                var Breadth = (txtParameter2.text as NSString).floatValue
                var perimeter = 2 * Length + 2 * Breadth;
                lblResult.text = "Perimeter = \(perimeter)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        case "Triangle":
            println("Triangle")
            
            
        case "Sphere":
            println("Sphere")
            btnPerimeterVol.setTitle("Volume", forState: UIControlState.Normal)
            lblResult.text = "Volume = "
            if (isDouble(txtParameter1.text) && txtParameter1.text != "")
            {
                var radius =  (txtParameter1.text as NSString).floatValue
                var Volume = (4 * 3.14 * radius * radius * radius) / 3;
                lblResult.text = "Volume = \(Volume)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
            
        case "Cylinder":
            println("Cylinder")
            if (isDouble(txtParameter1.text) && txtParameter1.text != "") && (isDouble(txtParameter2.text) && txtParameter2.text != "")            {
                var radius = (txtParameter1.text as NSString).floatValue
                var height = (txtParameter2.text as NSString).floatValue
                var volume = 3.14 * radius * radius * height;
                lblResult.text = "Volume = \(volume)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        case "Cone":
            println("Cone")
            if (isDouble(txtParameter1.text) && txtParameter1.text != "") && (isDouble(txtParameter2.text) && txtParameter2.text != "")            {
                var radius = (txtParameter1.text as NSString).floatValue
                var height = (txtParameter2.text as NSString).floatValue
                var volume = (3.14 * radius * radius * height) / 3;
                lblResult.text = "Volume = \(volume)";
            }
            else
            {
                
                let alert = UIAlertController(title: "Input Error", message: "Please enter valid value", preferredStyle: UIAlertControllerStyle.Alert)
                let ok = UIAlertAction(title: "Ok",  style: UIAlertActionStyle.Default) {(action: UIAlertAction!)->Void in
                    // nothing to do here
                }
                alert.addAction(ok)
                presentViewController(alert, animated: true, completion: nil)
                lblResult.text = "Please enter valid value"
            }
            
        default:
            println("Something else")
        }

        
    }
    
    @IBAction func btnCalculate(sender: AnyObject) {
                println("btnCalculate")
        
       if segmentControl.selectedSegmentIndex == 0
            {
                
          lblResult.text = "Area = \(txtParameter1.text)"
                
        }
        else
       {
          lblResult.text = "Perimeter = :P"
        }
        
        
    }
    

    

    @IBAction func indexChangedSegmentedControl(sender: AnyObject) {
        
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            println("Area")
           
        case 1:
            println("Rect")
        default:
            break; 
        }
        
    }
    
    
    func isDouble(s: String) -> Bool {
        // Tests if character is a digit
        func isDigit(c: Character) -> Bool {
            let s = String(c).unicodeScalars
            let d = s[s.startIndex].value
            if d >= 48 && d <= 57 {
                return true
            }
            return false
        }
        
        // Tests if input string is valid number
        var seenDot = false
        for c in s {
            if c == "." {
                if seenDot {
                    return false
                }
                seenDot = true
            }
            else if !isDigit(c) {
                return false
            }
            
        }
        return true
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
}
