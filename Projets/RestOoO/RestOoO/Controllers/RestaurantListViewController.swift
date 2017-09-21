//
//  RestaurantListViewController.swift
//  RestOoO
//
//  Created by Ludovic Ollagnier on 20/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {

    let directory = Directory.demoDirectory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let vc = segue.destination
            vc.title = "Youhou"
        } else if segue.identifier == "showForm" {
            guard let navController = segue.destination as? UINavigationController else { return }
            guard let rootController = navController.viewControllers.first else { return }
            rootController.title = "Bon appétit"
        }
    }
}

extension RestaurantListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return directory.list().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

//        if indexPath.row%2 == 0 {
//            cell.backgroundColor = UIColor.red
//        }

        let currentResto = directory.list()[indexPath.row]
        cell.textLabel?.text = currentResto.name
        cell.detailTextLabel?.text = currentResto.address

        return cell
    }
}
