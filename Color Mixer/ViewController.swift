//
//  ViewController.swift
//  Color Mixer
//
//  Created by Maria Mamina on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redColorNumberLabel: UILabel!
    @IBOutlet var greenColorNumberLabel: UILabel!
    @IBOutlet var blueColorNumberLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15

        setColor()
        setValue(for: redColorNumberLabel, greenColorNumberLabel, blueColorNumberLabel)
    }

    @IBAction func colorAction(_ sender: UISlider) {
        switch sender.tag {
        case 0: redColorNumberLabel.text = stringValue(from: sender)
        case 1: greenColorNumberLabel.text = stringValue(from: sender)
        case 2: blueColorNumberLabel.text = stringValue(from: sender)
        default: break
        }
        setColor()
    }
    
    private func setColor(){
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
        
    }
    
    private func stringValue(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValue(for label:UILabel...){
        label.forEach {label in
            switch label.tag {
            case 0:
                redColorNumberLabel.text = stringValue(from: redSlider)
            case 1:
                greenColorNumberLabel.text = stringValue(from: greenSlider)
            case 2:
                blueColorNumberLabel.text = stringValue(from: blueSlider)
            default:
                break
            }
        }
    }
}

