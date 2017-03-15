//
//  FeedPickerController.swift
//  snapChatProject
//
//  Created by Rexana Church on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedPickerController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var feedPickerTable: UITableView!
    @IBOutlet weak var selectedFeedLabel: UILabel!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedPickerTable.delegate = self
        feedPickerTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedPickerTableCell", for: indexPath) as! feedPickerTableCell
        cell.feedPickerLabel.text = threadNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFeedLabel.text = threadNames[indexPath.row]
    }
    
    @IBAction func goButtonWasPressed(_ sender: UIButton) {
        if let labelText = selectedFeedLabel.text {
            threads[labelText]!.append(image!) // This might be unwrapped wrong
            print(threads)
            let alertController = UIAlertController(title: "Snap sent!", message: "Your snap was posted to " + labelText, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: {
                (_)in
                self.performSegue(withIdentifier: "unwindToImagePicker", sender: self)
            }))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
