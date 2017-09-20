//
//  ViewController.swift
//  RestOoO
//
//  Created by Ludovic Ollagnier on 19/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var stylesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var noteSlider: UISlider!
    @IBOutlet weak var isAccessibleSwitch: UISwitch!

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UI Actions

    @IBAction func saveRestaurant(_ sender: UIButton) {
        
    }

    //MARK: - Public methods

    //MARK: - Private methods

}

