//
//  GRInstanceDataSource.swift
//  Jenkins
//
//  Created by Garrett Richards on 6/23/14.
//  Copyright (c) 2014 garrett richards. All rights reserved.
//

import UIKit

class GRInstanceModel:NSObject {
    
    var name:String
    var host:String

    func toDict() -> Dictionary<String,String>
    {
        var d  = Dictionary<String,String>()
        d["name"] = name
        d["host"] = host
        return d
    }

    init(name:NSString, host:NSString)
    {
        self.name = name
        self.host = host
    }

    init(fromDictionary dict:Dictionary<String,String>)
    {
        name = String()
        host = String()
        
        if let val  = dict["name"] {
            self.name = val
        }
        
        if let val = dict["host"] {
            self.host = val
        }
        
    }
    
}

class GRInstanceDataSource: NSObject , UITableViewDataSource {
   
    let userDefaultKey = "GRInstances"
    let cellIdentifier = "cell"
    var instances =  Dictionary<String, GRInstanceModel>()
    
    
    init() {
        super.init()
        loadFromDefaults()
    }
    
    func registerIdentifiersForTableView(tableView: UITableView?)
    {
        if let tableView = tableView
        {
            tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return instances.count
    }
    
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        if let cell = tableView!.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? UITableViewCell
        {
            var r =  indexPath!.row
            var instancesAsArray = instances.values
            
            
            
//            cell.textLabel.text =
//            return cell
        }
        return nil;
    }
    


    func loadFromDefaults()
    {
        var defs = NSUserDefaults.standardUserDefaults()
        var dict =  defs.dictionaryForKey(userDefaultKey)
//        println("defs: \(dict)")
        if let d = dict as? Dictionary<String,Dictionary<String,String>>
        {
            for(key,val: Dictionary<String,String>) in d
            {
                var model = GRInstanceModel(fromDictionary: val)
                instances[model.host] = model
            }
        }
    }

   
    func saveInstance(instance:GRInstanceModel)
    {
        instances[instance.host] = instance
        syncInstancesToDefaults()
    }
    
    func removeInstanceForKey(key:NSString)
    {
        instances[key] = nil
        syncInstancesToDefaults()
    }

    func syncInstancesToDefaults()
    {
        var nsDefaultsDict = Dictionary<String,Dictionary<String,String>>()
        for(key,val) in instances {
            nsDefaultsDict[key] = val.toDict()
        }
        
        var defs = NSUserDefaults.standardUserDefaults()
        defs.setObject(nsDefaultsDict, forKey: userDefaultKey)
        defs.synchronize()
    }

}
