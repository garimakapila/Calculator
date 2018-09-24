//
//  ViewController.swift
//  Calculator
//
//  Created by Garima Kapila on 9/4/17.
//  Copyright © 2017 Garima Kapila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var num:Double = 0;
    var op:String = "";
    var inOp = false;
    var deced:Bool = false;
    var equaled:Bool = false;
    var num1:Double = 0;
    var num2:Double = 0;
    var uncleared:Bool = false;
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if uncleared == true {
            num = 0;
            op = "";
            inOp = false;
            deced = false;
            resultsLabel.text = "0"
            equaled = false;
            num1 = 0;
            num2 = 0;
            uncleared = false;        }
        if resultsLabel.text == "0"{
            resultsLabel.text = sender.titleLabel!.text!
        }
        else{
            resultsLabel.text = resultsLabel.text! + sender.titleLabel!.text!
        }
        equaled = false;
    }
    
    @IBAction func decimal(_ sender: UIButton) {
        if uncleared == true {
            num = 0;
            op = "";
            inOp = false;
            deced = false;
            resultsLabel.text = "0"
            equaled = false;
            num1 = 0;
            num2 = 0;
            uncleared = false;
        }
        if !deced {
            resultsLabel.text = resultsLabel.text! + ".";
            deced = true;
        }
        equaled = false;
    }
    
    @IBAction func clear(_ sender: UIButton) {
        num = 0;
        op = "";
        inOp = false;
        deced = false;
        resultsLabel.text = "0"
        equaled = false;
        num1 = 0;
        num2 = 0;
    }
    
    @IBAction func percent(_ sender: UIButton) {
        equaled = false;
        var number:Double = Double(resultsLabel.text!)!;
        number = number/100;
        if resultsLabel.text != "0" {
            if number != floor(number) {
                deced = true;
            }
            resultsLabel.text = String(number);
        }
    }
    
    @IBAction func sign(_ sender: UIButton) {
        equaled = false;
        if Double(resultsLabel.text!)! != 0 {
            resultsLabel.text = String(-Double(resultsLabel.text!)!);
        }
    }
    
    @IBAction func operation(_ sender: UIButton) {
        uncleared = false;
        equaled = false;
        if inOp == false {
            num1 = Double(resultsLabel.text!)!;
            op = sender.titleLabel!.text!;
            inOp = true;
        }
        else {
            num2 = Double(resultsLabel.text!)!;
            if op == "/" && num != 0 {
                num1 = num1/num2
            }
            if op == "/" && num == 0 {
                num1 = 99999999999999;
            }
            if op == "x" {
                num1 = num1*num2
            }
            if op == "-" {
                num1 = num1-num2
            }
            if op == "+" {
                num1 = num1+num2
            }
            op = sender.titleLabel!.text!;
        }
        resultsLabel.text="0";
        deced = false;
    }
    
    @IBAction func equals(_ sender: UIButton) {
        if equaled != true {
            num = Double(resultsLabel.text!)!;
            equaled = true;
        }
        inOp = false;
        if op == "/" && num != 0 {
            num1 = num1/num
        }
        if op == "/" && num == 0 {
            num1 = 99999999999999;
        }
        if op == "x" {
            num1 = num1*num
        }
        if op == "-" {
            num1 = num1-num
        }
        if op == "+" {
            num1 = num1+num
        }
        if(num1 == floor(num1) && Double(resultsLabel.text!)! != 0) {
            resultsLabel.text = String(Int(num1));
        }
        else {
            resultsLabel.text = String(num1);
        }
        uncleared = true;
        deced = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

