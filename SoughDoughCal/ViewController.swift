//
//  ViewController.swift
//  SoughDoughCal
//
//  Created by Cameron Steer on 17/06/2017.
//  Copyright © 2017 Cameron Steer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flour: Float = 0
    var water: Float = 0
    var starter: Float = 0
    var starterHydration: Float = 0
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var saltLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var waterInput: UITextField!
    @IBOutlet weak var flourInput: UITextField!
    @IBOutlet weak var starterInput: UITextField!
    @IBOutlet weak var starterHydrationInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setPlaceHolder(textView: waterInput)
        setPlaceHolder(textView: flourInput)
        setPlaceHolder(textView: starterInput)
        setPlaceHolder(textView: starterHydrationInput)
        calLabel.text = "0%"
        saltLabel.text = "0g"
        weightLabel.text = "0g"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPlaceHolder(textView: UITextField) {
        textView.text = "0"
        textView.textColor = UIColor.lightGray
    }
    
    @IBAction func textViewDidBeginEditing(_ textView: UITextField) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }

    @IBAction func textViewDidEndEditing(_ textView: UITextField) {
        // setting it to "0" even if user is still typeing in the box
        if (textView.text?.isEmpty)! {
            setPlaceHolder(textView: textView)
            setPlaceHolder(textView: textView)
        } else {
            setValue(textView)
            updateOutput()
        }
    }
    
    func setValue(_ sender: UITextField) {
        switch sender {
        case waterInput:
            water = Float(waterInput.text!)!
            break
        case flourInput:
            flour = Float(flourInput.text!)!
            break
        case starterInput:
            starter = Float(starterInput.text!)!
            break
        case starterHydrationInput:
            starterHydration = Float(starterHydrationInput.text!)!
            break
        default:
            break
        }
    }
    
    func updateOutput() {
        calLabel.text = String(round(calHyrdation()))+"%"
        saltLabel.text = String(round(calSalt()))+"g"
        weightLabel.text = String(round(calWeight()))+"g"
    }
    
    func calHyrdation() -> Float {
        return ((water + getStarterWater()) / (flour + getStarterFlour())*100)
    }
    
    func calWeight() -> Float {
        return flour+water+starter
    }
    
    func calSalt() -> Float {
        return round(calWeight()*0.011)
    }

    func getStarterFlour() -> Float {
        return (starter / (1+(starterHydration/100)))
    }

    func getStarterWater() -> Float {
        return starter - getStarterFlour()
    }

}

