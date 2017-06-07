//
//  ShowImageViewController.swift
//  Quick Share
//
//  Created by Alexandre Thadeu Peres da SIlva on 6/1/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import UIKit
import Photos

class ShowImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var asset: PHAsset?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let myAsset = asset {
            PHImageManager.default().requestImage(for: myAsset, targetSize: CGSize(width: self.view.frame.width, height: self.view.frame.height), contentMode: .aspectFit, options: nil, resultHandler: { (result, info) in
                if let image = result {
                    self.imageView.image = image
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
