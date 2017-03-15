//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by Rexana Church on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var feedTable: UITableView!
    var imageToShow: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.delegate = self
        feedTable.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Should be number of snaps sent to this feed
        return threads[threadNames[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedViewCell", for: indexPath) as! feedViewCell
        cell.readStatusImage.image = UIImage(named: "unread")
        cell.senderNameLabel.text = "Rexana"
        cell.timeReceivedLabel.text = "1 min"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        imageToShow = threads[threadNames[indexPath.section]]?[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ImageViewController {
            dest.image = imageToShow
        }
    }
    
    @IBAction func unwindToFeedView(segue: UIStoryboardSegue) {}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
