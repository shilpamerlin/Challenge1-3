//
//  DetailViewController.swift
//  Challenge1-3
//
//  Created by Shilpa Joy on 2021-03-09.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    var selectedImage : String?
    var countryName : String?
    
    override func viewDidLoad() {
        navigationItem.largeTitleDisplayMode = .never
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let country = countryName {
            title = "\(country)"
        }
        if let imageload = selectedImage {
            detailImage.image = UIImage(named: imageload)
        }
        detailImage.layer.borderWidth = 1
        detailImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func shareTapped(){
        
        guard let image = detailImage.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image,countryName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
       
        present(vc,animated: true)
        //vc.isModalInPresentation = true
    }
    

}
