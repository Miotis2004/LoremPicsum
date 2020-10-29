//
//  ViewController.swift
//  LoremPicsum
//
//  Created by Field Employee on 10/27/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "PicsumTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PicsumTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PicsumTableViewCell", for: indexPath) as! PicsumTableViewCell
        
        
                
        NetworkManager.shared.fetchImage{ [weak self] (image, id) in
                    guard let self = self else {return}
            DispatchQueue.main.async {
                    cell.myImageView.image = image
                    cell.idLabel.text = "ID: \(id ?? "0")"
                }
        }
        
        return cell
    }

}

