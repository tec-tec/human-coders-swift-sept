//
//  ViewController.swift
//  Demo Core Data
//
//  Created by Ludovic Ollagnier on 22/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    fileprivate func createObjects(_ context: NSManagedObjectContext) {
        let jVerne = Author(context: context)
        jVerne.firstName = "Emile"
        jVerne.lasrtName = "Zola"

        let dltal = Book(context: context)
        dltal.title = "L'assomoir"
        dltal.author = jVerne

        CoreDataStack.instance.saveContext()
    }

    fileprivate func read(_ context: NSManagedObjectContext) {
        //        createObjects(context)

        let request: NSFetchRequest = Book.fetchRequest()
        let pred = NSPredicate(format: "title CONTAINS %@", "terre")

        //        request.predicate = pred
        let results = try? context.fetch(request)

        print(results)
        print(results?.first?.author?.lasrtName)
        print(results)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let context = CoreDataStack.instance.persistentContainer.viewContext

//        createObjects(context)
//        read(context)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
