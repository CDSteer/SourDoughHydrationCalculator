//
//  ViewController.swift
//  SoughDoughCal
//
//  Created by Cameron Steer on 17/06/2017.
//  Copyright © 2017 Cameron Steer. All rights reserved.
//  

import UIKit

class ViewController: UIViewController {
    var sourDough: SourDough!
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var saltLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var waterInput: UITextField!
    @IBOutlet weak var flourInput: UITextField!
    @IBOutlet weak var starterInput: UITextField!
    @IBOutlet weak var starterHydrationInput: UITextField!
    @IBOutlet weak var starterLock: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sourDough = SourDough(flour: 0, water: 0, starter: 0, starterHydration: 0)
        setPlaceHolder(textView: waterInput)
        setPlaceHolder(textView: flourInput)
        setPlaceHolder(textView: starterInput)
        setPlaceHolder(textView: starterHydrationInput)
        calLabel.text = "\(sourDough.calHyrdation())%"
        saltLabel.text = "\(sourDough.calSalt())g"
        weightLabel.text = "\(sourDough.calWeight())g"
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

    @IBAction func textViewDidEndChange(_ textView: UITextField) {
        if (!(textView.text?.isEmpty)!){
            setValue(textView)
            updateOutput()
        }
    }
    
    @IBAction func textViewDidEndEditing(_ textView: UITextField) {
        if (textView.text?.isEmpty)! {
            setPlaceHolder(textView: textView)
        }
    }
    
    @IBAction func lockStarter() {
        if (starterLock.isOn){
            lockTextField(starterInput)
            lockTextField(starterHydrationInput)
        } else {
            unlockTextField(starterInput)
            unlockTextField(starterHydrationInput)
        }
    }

    func lockTextField(_ textView: UITextField) {
        textView.backgroundColor = UIColor.darkGray
        textView.isUserInteractionEnabled = false
        textView.textColor = UIColor.white
        
    }
    
    func unlockTextField(_ textView: UITextField) {
        if (textView.text == "0") {
            setPlaceHolder(textView: textView)
            textView.backgroundColor = UIColor.white
            textView.isUserInteractionEnabled = true
        } else {
            textView.backgroundColor = UIColor.white
            textView.isUserInteractionEnabled = true
            textView.textColor = UIColor.black
        }
        
    }

    func setValue(_ sender: UITextField) {
        switch sender {
        case waterInput:
            sourDough.water = Float(waterInput.text!)!
            break
        case flourInput:
            sourDough.flour = Float(flourInput.text!)!
            break
        case starterInput:
            sourDough.starter = Float(starterInput.text!)!
            break
        case starterHydrationInput:
            sourDough.starterHydration = Float(starterHydrationInput.text!)!
            break
        default:
            break
        }
    }

    func updateOutput() {
        calLabel.text = String(sourDough.calHyrdation())+"%"
        saltLabel.text = String(sourDough.calSalt())+"g"
        weightLabel.text = String(sourDough.calWeight())+"g"
    }
    
}

