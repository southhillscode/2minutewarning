//
//  ScheduleTableViewController.swift
//  TwoMinuteWarning
//
//  Created by Zach Zhong on 12/25/17.
//  Copyright © 2017 Rob Fitzgerald, Inc. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {

    private var currentIndexPath = IndexPath(row: 0, section: 0)
    var schedule: ScheduleModel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let currentSchdedule = appDelegate.onBoardVC?.currentSchedule.text!
        
        if currentSchdedule != nil{
            schedule = alarmModel.getScheduleFrom(name: currentSchdedule!)
            
        }
        
        
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return schedule.currentSchedule.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "periodToTime", for: indexPath)
      cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        // Configure the cell...
        let dateComponent = schedule.currentSchedule[indexPath.row]
        
        if let actualDate = dateComponent{
            
            
            
            cell.textLabel?.text = "\(actualDate.hour!) : \(String(format: "%02d",actualDate.minute!))"
            cell.detailTextLabel?.text = "Period \(indexPath.row) end time"
        }
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
     //swift es basura
    }
    */
    @IBAction func changeDate(_ sender: Any) {
        
        let cell = tableView.cellForRow(at: currentIndexPath)
        let calenderComponet = Calendar.current.dateComponents([.hour, .minute, .calendar], from: datePicker.date)
        cell?.textLabel?.text = "\(calenderComponet.hour!) : \(calenderComponet.minute!)"
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let calender = Calendar.current
        datePicker.isHidden = false
        datePicker.date = calender.date(from: schedule.currentSchedule[indexPath.row]!)!
        currentIndexPath = indexPath
        
        
        
    }

}
