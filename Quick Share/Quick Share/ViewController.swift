//
//  ViewController.swift
//  Quick Share
//
//  Created by Alexandre Thadeu Peres da SIlva on 6/1/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var assetCollection: PHAssetCollection?
    var photos:PHFetchResult<PHAsset>?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let reuseIdentifier = "tableViewCell"
    var dummyObjects = ["hi", "there", "iam", "äwesome"]
    let collection = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
    var contador = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (collection.firstObject != nil) {
            self.assetCollection = collection.firstObject! as PHAssetCollection
            
            let options = PHFetchOptions()
            options.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
            options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            
            self.photos = PHAsset.fetchAssets(in: assetCollection!, options:options)
            contador = (photos?.count)!
        }
        else {
            print("nothing found")
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            if (id == "showFullImageSegue") {
                let newVc = segue.destination as! ShowImageViewController
                var indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
                if let asset = self.photos?[(indexPath!.row)] {
                    newVc.asset = asset
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableView = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for:indexPath) as! MyTableView
        
        if let asset = self.photos?[indexPath.row] {
            PHImageManager.default().requestImage(for: asset, targetSize: CGSize.init(width: 320, height: 240), contentMode: .aspectFill, options: nil, resultHandler: { (result, info) in
                if let image = result {
                    cell.myImageView?.image = image
                }
            })
        }
        
        cell.myImageView.image = UIImage(named: "polaroid")
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contador
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
    }


}

