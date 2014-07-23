//
//  GRJnstancesViewController.swift
//  Jenkins
//
//  Created by Garrett Richards on 6/23/14.
//  Copyright (c) 2014 garrett richards. All rights reserved.
//

import UIKit

class GRJnstancesViewController: UITableViewController , UITableViewDelegate {

    let tableViewDataSource: GRInstanceDataSource? = GRInstanceDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewDataSource()
    }
    
    func configureTableViewDataSource(){
        tableViewDataSource!.registerIdentifiersForTableView(tableView)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = self
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let client = GRJenkinsAPIClient()
        client.getProjectList(nil)
    }
    
    
    @IBAction func actionAddInstance(sender:AnyObject?) {
        tableViewDataSource!.saveInstance(GRInstanceModel(name:"feutil mobile", host:"http://feutil1:8080/view/Mobile-Ios"))
        tableView.reloadData()
    }
    

}
