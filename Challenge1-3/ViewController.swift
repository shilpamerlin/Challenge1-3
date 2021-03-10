//
//  ViewController.swift
//  Challenge1-3
//
//  Created by Shilpa Joy on 2021-03-09.
//

import UIKit

class ViewController: UITableViewController {

    var countries = [String]()
    @IBOutlet var flagTblView: UITableView!
    
    override func viewDidLoad() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Countries"
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png"){
                countries.append(item)
            }
        }
        print(countries)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = flagTblView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        let countryName = countries[indexPath.row].replacingOccurrences(of: "@3x.png", with: "")
        cell.textLabel?.text = countryName.count > 2 ? countryName.capitalized : countryName.uppercased()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailViewController {
            vc.selectedImage = countries[indexPath.row]
            let countryName = countries[indexPath.row].replacingOccurrences(of: "@3x.png", with: "")
            vc.countryName = countryName.count > 2 ? countryName.capitalized : countryName.uppercased()
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

