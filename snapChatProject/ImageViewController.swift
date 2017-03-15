//
//  ImageViewController.swift
//  snapChatProject
//
//  Created by Rexana Church on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageButton: UIButton!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageButton.setImage(image, for: UIControlState.normal)
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imageWasPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToFeedView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
