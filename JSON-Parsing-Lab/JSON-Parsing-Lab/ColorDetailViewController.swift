//
//  ColorDetailViewController.swift
//  JSON-Parsing-Lab
//
//  Created by Alexander George Legaspi on 8/27/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    var color: Color!
    
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var colorRGB: UILabel!
    @IBOutlet weak var colorHex: UILabel!
    
    @IBOutlet var colorDetailViewController: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorDetailViewController.backgroundColor = color.rgb.fraction.backgroundColor()
        colorName.text = color.name.value
        colorRGB.text = "R: \(color.rgb.fraction.r)"
        colorHex.text = color.hex.value

    }

}
