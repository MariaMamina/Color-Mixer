//
//  ViewController.swift
//  Color Mixer
//
//  Created by Maria Mamina on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    @IBOutlet var redColorNumber: UILabel!
    @IBOutlet var greenColorNumber: UILabel!
    @IBOutlet var blueColorNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
    }

    @IBAction func redSlider() {
    }
    
    @IBAction func greenSlider() {
    }
    
    @IBAction func blueSlider() {
    }
}

