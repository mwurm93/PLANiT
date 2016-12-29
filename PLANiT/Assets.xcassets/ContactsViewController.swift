//
//  ContactsViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 12/28/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController  {
    
    // MARK: Outlets
    @IBOutlet weak var groupMemberListTable: UITableView!
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        groupMemberListTable.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
