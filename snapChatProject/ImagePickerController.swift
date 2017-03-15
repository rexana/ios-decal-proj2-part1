//
//  imagePickerController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImagePickerController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var imageCollectionView: UICollectionView!
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageCollectionView.collectionViewLayout = ImageFlowLayout.init()
        self.imageCollectionView.backgroundColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func selectImage(_ image: UIImage) {
        //The image being selected is passed in as "image".
        selectedImage = image
        performSegue(withIdentifier: "imagePickerToFeedPicker", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? FeedPickerController {
            dest.image = selectedImage
        }
    }
    
    @IBAction func unwindToImagePicker(segue: UIStoryboardSegue) {}
    
    
    //DON'T MODIFY CODE HERE AND BELOW!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as! imageCollectionViewCell
        cell.image.image = allImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! imageCollectionViewCell
        selectImage(selectedCell.image.image!)
    }
}
