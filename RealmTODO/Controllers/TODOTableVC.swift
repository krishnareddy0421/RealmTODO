//
//  TODOTableVC.swift
//  RealmTODO
//
//  Created by vamsi krishna reddy kamjula on 11/26/17.
//  Copyright © 2017 kvkr. All rights reserved.
//

import UIKit
import RealmSwift

class TODOTableVC: UITableViewController {

    
    var works : Results<Work>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        works = realm.objects(Work.self)
        print(works)
        
        // MARK: - Reloading the TableView Data
        print("Reload")
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if works != nil {
            return works.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "worksCell", for: indexPath)

        cell.textLabel?.text = works[indexPath.row].workTitle
        cell.detailTextLabel?.text = works[indexPath.row].scheduleTime
        
        return cell
    }
}
