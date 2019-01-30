//
//  PhotosViewController.swift
//  tumblr+
//
//  Created by Judith Ramirez on 1/30/19.
//  Copyright © 2019 Judith Ramirez. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var post: [[String:Any]] = []
    
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self

        // Do any additional setup after loading the view.
        
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/firstdayofmyexistence.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                let responseDict = dataDictionary["response"] as! [String:Any]
                
                self.post = responseDict["posts"] as! [[String:Any]]
                
                self.tabelView.reloadData()
                // TODO: Get the posts and store in posts property
                
                // TODO: Reload the table view
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tumblrCellTableViewCell") as! tumblrCellTableViewCell
        
       let posts = post[indexPath.row]
        
        if let photos = posts["photos"] as? [[String:Any]]{
            //photo is true
            let photo = photos[0]
            
            let originalSize = photo["original_size"] as! [String:Any]
            
            let urlString = originalSize["url"] as! String
            
            let url = URL(string: urlString)
            
            cell.photoView.af_setImage(withURL: url!)
        }
        
        return cell
        
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
