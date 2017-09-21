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
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(modelUpdated(note:)), name: Notification.Name(Constants.NotificationNames.modelUpdated), object: directory)

//        NotificationCenter.default.addObserver(forName: Notification.Name(Constants.NotificationNames.modelUpdated), object: directory, queue: OperationQueue.main) { (note) in
//            self.tableView.reloadData()
//            print("\(note.userInfo!["restoName"])")
//        }
    }

    @objc func modelUpdated(note: Notification) {
        tableView.reloadData()
        print("\(note.userInfo!["restoName"])")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {

            guard let cell = sender as? UITableViewCell else { return }
            guard let indexRow = tableView.indexPath(for: cell)?.row else { return }
            guard let vc = segue.destination as? DetailsViewController else { return }

            let resto = directory.list()[indexRow]
            vc.displayedRestaurant = resto

        } else if segue.identifier == "showForm" {
            guard let navController = segue.destination as? UINavigationController else { return }
            guard let rootController = navController.viewControllers.first as?  ViewController else { return }
            rootController.directory = directory
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
