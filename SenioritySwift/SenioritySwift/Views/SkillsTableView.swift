//
//  SkillsTableView.swift
//  SenioritySwift
//
//  Created by Carlos Rodrigo Salas Centeno on 21/03/23.
//

import UIKit

class SkillsTableView: UITableView, UITableViewDataSource {

    var skills: [Skill] = [] {
        didSet {
            reloadData()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        dataSource = self
        register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = skills[indexPath.row].name
        return cell
    }

}

