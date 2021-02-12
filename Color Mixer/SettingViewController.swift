//
//  SettingViewController.swift
//  Color Mixer
//
//  Created by Maria Mamina on 29.01.2021.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redColorNumberLabel: UILabel!
    @IBOutlet var greenColorNumberLabel: UILabel!
    @IBOutlet var blueColorNumberLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    
    var delegate: SettingViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorView.layer.cornerRadius = 15

        setColor()
        setLabelValue(for: redColorNumberLabel,
                 greenColorNumberLabel,
                 blueColorNumberLabel)
        setValueTextField(for: redTextField,
                          greenTextField,
                          blueTextField)
    }

    @IBAction func colorAction(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redColorNumberLabel.text = stringValue(from: sender)
            redTextField.text = stringValue(from: sender)
        case 1:
            greenColorNumberLabel.text = stringValue(from: sender)
            greenTextField.text = stringValue(from: sender)
        case 2:
            blueColorNumberLabel.text = stringValue(from: sender)
            blueTextField.text = stringValue(from: sender)
        default: break
        }
        setColor()
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        delegate.setNewColorValues(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
        dismiss(animated: true)
        
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
    
    private func setLabelValue(for label:UILabel...){
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
    
    private func setValueTextField(for textField:UITextField...){
        textField.forEach {textField in
            switch textField.tag {
            case 0:
                redTextField.text = stringValue(from: redSlider)
            case 1:
                greenTextField.text = stringValue(from: greenSlider)
            case 2:
                blueTextField.text = stringValue(from: blueSlider)
            default:
                break
            }
        }
    }
}

extension SettingViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newColorValue = textField.text else { return }
        guard let newColorNumberValue = Float(newColorValue) else { return }
        switch textField.tag {
        case 0:
            redSlider.value = newColorNumberValue
            redColorNumberLabel.text = stringValue(from: redSlider)
        case 1:
            greenSlider.value = newColorNumberValue
            greenColorNumberLabel.text = stringValue(from: greenSlider)
        case 2:
            blueSlider.value = newColorNumberValue
            blueColorNumberLabel.text = stringValue(from: blueSlider)
        default:
            break
        }
    }
    }

