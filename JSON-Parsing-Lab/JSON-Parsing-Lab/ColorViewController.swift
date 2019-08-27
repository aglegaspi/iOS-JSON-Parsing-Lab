//
//  ColorViewController.swift
//  JSON-Parsing-Lab
//
//  Created by Alexander George Legaspi on 8/27/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var colorTableView: UITableView!
    
    var colors = [Color]() {
        didSet {
            colorTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        loadData()
    }
    
    private func configureTableView() {
        colorTableView.delegate = self
        colorTableView.dataSource = self
    }
    
    private func loadData() {
        
        // we are using Bundle and it's methods main and path.
        guard let pathToJSON = Bundle.main.path(forResource: "colors", ofType: "json") else {
            fatalError("no JSON file")
        }
        let url = URL(fileURLWithPath: pathToJSON)
        
        do {
            let data = try Data(contentsOf: url)
            let colorsFromJSON = try Color.getColors(from: data)
            colors = colorsFromJSON
        } catch {
            fatalError("couldn't get episodes: \(error)")
        }
    }
    
}

extension ColorViewController: UITableViewDelegate {}

extension ColorViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name.value
        cell.detailTextLabel?.text = color.name.value
        
        return cell
    }
    
    
}
