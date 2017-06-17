//
//  ViewController.swift
//  SoughDoughCal
//
//  Created by Cameron Steer on 17/06/2017.
//  Copyright © 2017 Cameron Steer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flour:Float = 0
    var water:Float = 0
    var starter:Float = 0
    var starterHydration:Float = 0
    
    var hydration:Float = 0
    
    @IBOutlet weak var calLabel: UILabel!
    
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
        setPlaceHolderP(textView: starterHydrationInput)
        calLabel.text = "0%"
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPlaceHolder(textView:UITextField) {
        textView.text = "0"
        textView.textColor = UIColor.lightGray
    }
    
    func setPlaceHolderP(textView:UITextField) {
        textView.text = "0%"
        textView.textColor = UIColor.lightGray
    }
    
    @IBAction func textViewDidBeginEditing(_ textView: UITextField) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }

    @IBAction func textViewDidEndEditing(_ textView: UITextField) {
        if (textView.text?.isEmpty)! {
            if (textView == starterHydrationInput) {
                setPlaceHolderP(textView: textView)
            } else {
                setPlaceHolder(textView: textView)
            }
        } else {
            setValue(textView)
            
            hydration = calHyrdation()
            showHydration()
        }
    }
    
    func setValue(_ sender:UITextField){
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
            // starterHydrationInput.text = (sender.text! + "%")
            break
        default:
            break
        }
    }
    
    func showHydration(){
        calLabel.text = String(round(calHyrdation()))+"%"
    }
    
    @IBAction func cal(_ sender: UIButton){
        // setVals()
        showHydration()
    }
    
    func calHyrdation() -> Float {
        return ((water + getStarterWater()) / (flour + getStarterFlour())*100)
    }
    
    func getStarterFlour() -> Float {
        return (starter / (1+(starterHydration/100)))
    }
    
    func getStarterWater() -> Float{
        return starter - getStarterFlour()
    }


}

