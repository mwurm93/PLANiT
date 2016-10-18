//
//  CalendarViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //MARK: Outlets
    @IBOutlet weak var pickerDepart: UIPickerView!
    @IBOutlet weak var pickerReturn: UIPickerView!
    
    var pickerDepartData: [String] = [String]()
    var pickerReturnData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data:
        self.pickerDepart.delegate = self
        self.pickerDepart.dataSource = self
        self.pickerReturn.delegate = self
        self.pickerReturn.dataSource = self
        
        // Input data into the Array:
        pickerDepartData = ["No preference","Early morning","Morning", "Afternoon","Evening","Night"]
        pickerReturnData = ["No preference","Early morning","Morning", "Afternoon","Evening","Night"]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerDepart: UIPickerView) -> Int {
        return 1
    }

    
    // The number of rows of data
    func pickerView(_ pickerDepart: UIPickerView, numberOfRowsInComponent: Int) -> Int {
        return pickerDepartData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerDepart: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDepartData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerDepart: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }


   
}
