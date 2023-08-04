//
//  ImageViewController.swift
//  GetAndPostRequests
//
//  Created by Сергей Насыбуллин on 04.08.2023.
//

import UIKit

class ImageViewController: UIViewController {
    
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
        
        // Провекра валидности
        guard let url = URL(string: "https://img.freepik.com/free-photo/side-view-mix-sushi-rolls-on-a-tray-with-ginger-and-wasabi_141793-14242.jpg")
        else { return }
        
        // Создания ссесия синглтон
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.activitiIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
    }
    


}
