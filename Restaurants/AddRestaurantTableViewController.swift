//
//  AddRestaurantTableViewController.swift
//  Restaurants
//
//  Created by Алсу Гиниятуллина  on 24.04.2021.
//

import UIKit

class AddRestaurantTableViewController: UITableViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: "photo.jpg")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let alertController = UIAlertController(title: "Источник фотографий", message: nil, preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: "Камера", style: .default) { (action) in
                
                
            }
            let photoAction = UIAlertAction(title: "Галерея", style: .default) { (action) in
                
            }
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            alertController.addAction(cameraAction)
            alertController.addAction(photoAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func chooseImagePickerAction(source: UIImagePickerControllerDelegate) {
        
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        view.endEditing(true)
//       tableView.resignFirstResponder()
//    }
    
    
}
