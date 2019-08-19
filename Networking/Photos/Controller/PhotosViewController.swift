//
//  CoursesViewController.swift
//  Networking
//
//  Created by Nikita Kuprik on 8/19/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private var photos = [Photo]()
    private let url = "http://jsonplaceholder.typicode.com/photos"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData() 
    }
    
    func fetchData() {
        NetworkManager.fetchData(url: url) { (photos) in
            self.photos = photos
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func configureCell(cell: TableViewCell, for indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        cell.titleLabel.text = photo.title
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: photo.url) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: imageData)
            }
        }
    }
    
}

extension PhotosViewController: UITableViewDelegate {}

extension PhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        configureCell(cell: cell, for: indexPath)
        return cell
    }
    
    
}
