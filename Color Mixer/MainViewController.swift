//
//  MainViewController.swift
//  Color Mixer
//
//  Created by Maria Mamina on 12.02.2021.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setNewColorValues(redColor: Float, greenColor: Float, blueColor: Float)
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let SettingVC = segue.destination as? SettingViewController else { return }
        SettingVC.delegate = self
        SettingVC.color = view.backgroundColor
        
    }
}
extension MainViewController: SettingViewControllerDelegate {
    func setNewColorValues(redColor: Float, greenColor: Float, blueColor: Float) {
        view.backgroundColor = UIColor(red: CGFloat(redColor),
                                       green: CGFloat(greenColor),
                                       blue: CGFloat(blueColor),
                                       alpha: 1)
    }
    
    
}
