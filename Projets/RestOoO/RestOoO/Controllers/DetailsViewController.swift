//
//  DetailsViewController.swift
//  RestOoO
//
//  Created by Ludovic Ollagnier on 21/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var displayedRestaurant: Restaurant?

    @IBOutlet weak var restoNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let resto = displayedRestaurant else { fatalError("No restaurant provided")}
        restoNameLabel.text = resto.address
        title = resto.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
