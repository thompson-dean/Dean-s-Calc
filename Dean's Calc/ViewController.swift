//
//  ViewController.swift
//  Dean's Calc
//
//  Created by Dean Thompson on 2021/02/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    @IBOutlet weak var zeroDesign: UIButton!
    @IBOutlet weak var decimalDesign: UIButton!
    @IBOutlet weak var oneDesign: UIButton!
    @IBOutlet weak var twoDesign: UIButton!
    @IBOutlet weak var threeDesign: UIButton!
    @IBOutlet weak var fourDesign: UIButton!
    @IBOutlet weak var fiveDesign: UIButton!
    @IBOutlet weak var sixDesign: UIButton!
    @IBOutlet weak var sevenDesign: UIButton!
    @IBOutlet weak var eightDesign: UIButton!
    @IBOutlet weak var nineDesign: UIButton!
    
    
    
    @IBOutlet weak var equalsDesign: UIButton!
    @IBOutlet weak var plusDesign: UIButton!
    @IBOutlet weak var minusDesign: UIButton!
    @IBOutlet weak var timesDesign: UIButton!
    @IBOutlet weak var divideDesign: UIButton!
    @IBOutlet weak var percentageDesign: UIButton!
    @IBOutlet weak var backTapDesign: UIButton!
    @IBOutlet weak var clearAllDesign: UIButton!
    
    
    
    
    
    var workings:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oneDesign.layer.borderWidth = 5
        oneDesign.layer.cornerRadius = 15
        twoDesign.layer.borderWidth = 5
        twoDesign.layer.cornerRadius = 15
        threeDesign.layer.borderWidth = 5
        threeDesign.layer.cornerRadius = 15
        fourDesign.layer.borderWidth = 5
        fourDesign.layer.cornerRadius = 15
        fiveDesign.layer.borderWidth = 5
        fiveDesign.layer.cornerRadius = 15
        sixDesign.layer.borderWidth = 5
        sixDesign.layer.cornerRadius = 15
        sevenDesign.layer.borderWidth = 5
        sevenDesign.layer.cornerRadius = 15
        eightDesign.layer.borderWidth = 5
        eightDesign.layer.cornerRadius = 15
        nineDesign.layer.borderWidth = 5
        nineDesign.layer.cornerRadius = 15
        
        decimalDesign.layer.borderWidth = 5
        decimalDesign.layer.cornerRadius = 15
        zeroDesign.layer.borderWidth = 5
        zeroDesign.layer.cornerRadius = 15
        plusDesign.layer.borderWidth = 5
        plusDesign.layer.cornerRadius = 15
        minusDesign.layer.borderWidth = 5
        minusDesign.layer.cornerRadius = 15
        timesDesign.layer.borderWidth = 5
        timesDesign.layer.cornerRadius = 15
        divideDesign.layer.borderWidth = 5
        divideDesign.layer.cornerRadius = 15
        percentageDesign.layer.borderWidth = 5
        percentageDesign.layer.cornerRadius = 15
        backTapDesign.layer.borderWidth = 5
        backTapDesign.layer.cornerRadius = 15
        clearAllDesign.layer.borderWidth = 5
        clearAllDesign.layer.cornerRadius = 15
        equalsDesign.layer.borderWidth = 5
        equalsDesign.layer.cornerRadius = 15
       
    
        calculatorWorkings.text = "WELCOME TO "
        calculatorResults.text = "AYUMI CALC"
        
        
    }
    
    
        func clearAll() {
            workings = ""
            calculatorWorkings.text = ""
            calculatorResults.text = "0"
        
    }
    @IBAction func equalsTap(_ sender: Any) {
        if(validInput())
        {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        
        var count = 0
        var funcCharindexes = [Int]()
    
        for char in workings {
            if(specialCharacter(char: char)) {
                funcCharindexes.append(count)
            }
            count += 1
        }
        
        var previous:Int = -1
        
        for index in funcCharindexes {
            if(index == 0) {
                return false
            }
            if(index == workings.count - 1) {
                return false
            }
            
            if(previous != -1) {
                if(index - previous == 1) {
                    return false
                }
                
            }
            previous = index
        }
        
        
        return true
    
    }
    func specialCharacter (char: Character) -> Bool {
        if(char == "*") {
            return true
        }
        if(char == "/") {
            return true
        }
        if(char == "+") {
            return true
        }
        if(char == "%") {
            return true
        }
        return false
    }
    
    
    func formatResult(result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
        
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
        
        clearAll()
        
    }
    
    @IBAction func backTap(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
        if(!workings.isEmpty) {
            workings.removeLast()
            calculatorWorkings.text = workings
            
            }
    }
    
    
    func addToWorkings(value: String) {
        workings = workings + value
        calculatorWorkings.text = workings
        
    }
        
    
    @IBAction func percentage(_ sender: UIButton) {
        addToWorkings(value: "%")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func divideTap(_ sender: UIButton) {
        addToWorkings(value: "/")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func timesTap(_ sender: UIButton) {
        addToWorkings(value: "*")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func minusTap(_ sender: UIButton) {
        addToWorkings(value: "-")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func plusTap(_ sender: UIButton) {
        addToWorkings(value: "+")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func decimalTap(_ sender: UIButton) {
        addToWorkings(value: ".")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func zeroTap(_ sender: UIButton) {
        addToWorkings(value: "0")
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func oneTap(_ sender: UIButton) {
        addToWorkings(value: "1")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func twoTap(_ sender: UIButton) {
        addToWorkings(value: "2")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func threeTap(_ sender: UIButton) {
        addToWorkings(value: "3")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func fourTap(_ sender: UIButton) {
        addToWorkings(value: "4")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func fiveTap(_ sender: UIButton) {
        addToWorkings(value: "5")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func sixTap(_ sender: UIButton) {
        addToWorkings(value: "6")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func sevenTap(_ sender: UIButton) {
        addToWorkings(value: "7")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func eightTap(_ sender: UIButton) {
        addToWorkings(value: "8")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
    @IBAction func nineTap(_ sender: UIButton) {
        addToWorkings(value: "9")
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1.0
        }
    }
    
}

