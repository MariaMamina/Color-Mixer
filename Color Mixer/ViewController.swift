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
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
    }

    
    @IBAction func ColorAction() {
        redColorNumber.text = String(format: "%.2f", redSlider.value)
        greenColorNumber.text = String(format: "%.2f", greenSlider.value)
        blueColorNumber.text = String(format: "%.2f", blueSlider.value)
        updateColor()
    }
    
    private func updateColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
}

