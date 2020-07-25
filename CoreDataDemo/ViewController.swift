//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Prashant on 25/07/20.
//  Copyright © 2020 Prashant. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        print(self.fetchAllData())
        let data = self.fetchAllData()
        if data.count > 0 {
            imageView.image = UIImage(data: data[0].image!)
        }
    }
    
    @IBAction func actionInsert(_ sender: Any) {
        
        let imgData = UIImage(named: "sample-redblack-sign-blackred-round-260nw-1527866849.jpg")!.pngData()
        
        let data = PUserInfo()
        data.name = "Prashant"
        data.image = imgData
        data.id = UUID().uuidString
        
        let dic = NSMutableDictionary()
        dic.addEntries(from: data.toDictionary())
        
        SBCoreDataManagedObjectStore.shared().createOrUpdateEntities(of: NSStringFromClass(UserInfo.self), from: dic as? JSON)
        
        print(self.fetchAllData())
    }
    
    func fetchAllData() -> [UserInfo] {
        let managementContext = SBCoreDataAdapter.shared().persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entity = NSEntityDescription.entity(forEntityName: NSStringFromClass(UserInfo.self), in: managementContext)
        fetchRequest.entity = entity
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let result = try managementContext.fetch(fetchRequest)
            let data = result as! [UserInfo]
            return data as [UserInfo]
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
}

