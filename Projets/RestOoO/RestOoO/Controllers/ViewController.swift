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

    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var stylesSegmentedControl: UISegmentedControl!
    @IBOutlet weak var noteSlider: UISlider!
    @IBOutlet weak var isAccessibleSwitch: UISwitch!

    var directory = Directory()

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureStylesSegmentedControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - UI Actions

    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {


        print("View tapped")
        view.endEditing(false)
    }

    @IBAction func saveRestaurant() {

        guard let name = nameTextField.text, name.count > 2 else { return }
        guard let address = addressTextField.text, address.count > 5 else { return }

        var stylesSet: Set<Restaurant.Style> = []
        if let style = Restaurant.Style(allIndex: stylesSegmentedControl.selectedSegmentIndex) {
            stylesSet.insert(style)
        }

        let newResto = Restaurant(name: name, address: address, styles: stylesSet, note: Int(roundf(noteSlider.value)), accessible: isAccessibleSwitch.isOn)
        directory.add(newResto)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    //MARK: - Internal methods

    //MARK: - Private methods

    private func configureStylesSegmentedControl() {

        stylesSegmentedControl.removeAllSegments()
        for (index, style) in Restaurant.Style.all.enumerated() {
            stylesSegmentedControl.insertSegment(withTitle: style.rawValue.capitalized, at: index, animated: false)
        }
    }

}
