//
//  MainViewController.swift
//  Networking
//
//  Created by Nikita Kuprik on 8/19/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit

enum Actions: String, CaseIterable {
    case downloadImage = "Download Image"
    case get = "GET"
    case post = "POST"
    case ourPhotos = "Photos from JSON"
    case uploadImage = "Upload Image"
}

private let url = "http://jsonplaceholder.typicode.com/albums"
private let uploadImage = "https://api.imgur.com/3/image"

class MainViewController: UICollectionViewController {
    
    let actions = Actions.allCases
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label.text = actions[indexPath.row].rawValue
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.row]
        
        switch action {
        case .downloadImage:
            performSegue(withIdentifier: "showImage", sender: self)
        case .get:
            NetworkManager.getRequest(url: url)
        case .post:
            NetworkManager.postRequest(url: url)
        case .ourPhotos:
            performSegue(withIdentifier: "showPhotos", sender: self)
        case .uploadImage:
            NetworkManager.uploadImage(url: uploadImage)
        }
    }
}
