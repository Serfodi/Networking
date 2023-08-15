//
//  ImageViewController.swift
//  GetAndPostRequests
//
//  Created by Сергей Насыбуллин on 04.08.2023.
//

import UIKit

class ImageViewController: UIViewController {
    
    private let url = "https://img.freepik.com/free-photo/side-view-mix-sushi-rolls-on-a-tray-with-ginger-and-wasabi_141793-14242.jpg"
    
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiIndicator.isHidden = true
        activitiIndicator.hidesWhenStopped = true
        fetchImage()
    }
    

    func fetchImage() {
        activitiIndicator.isHidden = false
        activitiIndicator.startAnimating()
        
        NetworkManager.downloadImage(url: url) { image in
            self.activitiIndicator.stopAnimating()
            self.imageView.image = image
        }
        
    }
    


}
