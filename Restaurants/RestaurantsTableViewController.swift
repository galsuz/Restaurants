//
//  RestaurantsTableViewController.swift
//  Restaurants
//
//  Created by Алсу Гиниятуллина  on 12.04.2021.
//

import UIKit

class RestaurantsTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Ogonёk Grill&Bar", type: "ресторан", location: "Уфа", image: "ogonek.jpg", isVisited: false),
        Restaurant(name: "Елу", type: "ресторан", location: "Уфа, какой-то очеееееееееееееееееень очень длинный адрес", image: "elu.jpg", isVisited: false),
        Restaurant(name: "Bonsai", type: "ресторан", location: "Уфа", image: "bonsai.jpg", isVisited: false),
        Restaurant(name: "Дастархан", type: "ресторан", location: "Уфа", image: "dastarhan.jpg", isVisited: false),
        Restaurant(name: "Индокитай", type: "ресторан", location: "Уфа", image: "indokitay.jpg", isVisited: false),
        Restaurant(name: "X.O", type: "ресторан-клуб", location: "Уфа", image: "x.o.jpg", isVisited: false),
        Restaurant(name: "Балкан Гриль", type: "ресторан", location: "Уфа", image: "balkan.jpg", isVisited: false),
        Restaurant(name: "Respublica", type: "ресторан", location: "Уфа", image: "respublika.jpg", isVisited: false),
        Restaurant(name: "Speak Easy", type: "ресторанный комплекс", location: "Уфа", image: "speakeasy.jpg", isVisited: false),
        Restaurant(name: "Morris Pub", type: "ресторан", location: "Уфа", image: "morris.jpg", isVisited: false),
        Restaurant(name: "Вкусные истории", type: "ресторан", location: "Уфа", image: "istorii.jpg", isVisited: false),
        Restaurant(name: "Классик", type: "ресторан", location: "Уфа", image: "klassik.jpg", isVisited: false),
        Restaurant(name: "Love&Life", type: "ресторан", location: "Уфа", image: "love.jpg", isVisited: false),
        Restaurant(name: "Шок", type: "ресторан", location: "Уфа", image: "shok.jpg", isVisited: false),
        Restaurant(name: "Бочка", type: "ресторан", location:  "Уфа", image: "bochka.jpg", isVisited: false)]
    
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? RestaurantTableViewCell {
            
            cell.restaurantImage.image = UIImage(named: restaurants[indexPath.row].image)
            cell.restaurantImage.layer.cornerRadius = 39.5
            cell.restaurantImage.clipsToBounds = true
            cell.name.text = restaurants[indexPath.row].name
            cell.location.text = restaurants[indexPath.row].location
            cell.type.text = restaurants[indexPath.row].type
            
        }
        
        if self.restaurants[indexPath.row].isVisited {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        //showAlert(indexPath: indexPath)
    }

    func showAlert(indexPath: IndexPath) {

        let ac = UIAlertController(title: nil, message: "Выберите действия", preferredStyle: .actionSheet)
        let callAction = UIAlertAction(title: "Позвонить +7(999)1501-12\(indexPath.row)", style: .default) {

            (action: UIAlertAction) -> Void in

            let alertC = UIAlertController(title: nil, message: "Вызов не может быть совершен", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Окей", style: .cancel, handler: nil)
            alertC.addAction(ok)
            self.present(alertC, animated: true, completion: nil)

        }

        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let isVisitedTitle = self.restaurants[indexPath.row].isVisited ? "Я не был здесь" : "Я был здесь"
        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) {

            (action) in

            let cell = self.tableView.cellForRow(at: indexPath)
            self.restaurants[indexPath.row].isVisited = !self.restaurants[indexPath.row].isVisited
            cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none

        }

        ac.addAction(cancel)
        ac.addAction(callAction)
        ac.addAction(isVisited)
        present(ac, animated: true, completion: nil)

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteItem = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view, boolValue) in
            
            self.restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let shareItem = UIContextualAction(style: .normal, title: "Поделиться") { (contextualAction, view, boolValue) in
            
            let defaultText = "Я сейчас в " + self.restaurants[indexPath.row].name
            
            if let image = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
            
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem, shareItem])
        
        return swipeActions
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! DetailViewController
                dvc.restaurant = self.restaurants[indexPath.row]
            }
        }
    }
}
