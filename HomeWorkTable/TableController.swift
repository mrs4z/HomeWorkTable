//
//  TableController.swift
//  HomeWorkTable
//
//  Created by Александр Горденко on 14.10.2021.
//

import UIKit

final class TableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: UITableView.Style.grouped)
        table.register(TableItemCell.self, forCellReuseIdentifier: TableItemCell.identifier)
        table.register(TableItemCellSwitcher.self, forCellReuseIdentifier: TableItemCellSwitcher.identifier)
        table.register(TableItemCellDescription.self, forCellReuseIdentifier: TableItemCellDescription.identifier)
        return table
    }()
    
    var items = [TableCategorie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        setUp()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        updateLayout(with: view.frame.size)
    }
    
    func setUp() {
        items = TableCategorie.getItems()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    
    private func updateLayout(with size: CGSize) {
       tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = items[indexPath.section].items[indexPath.row]
        
        switch type.self {
            case .simple(item: let item):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TableItemCell.identifier,
                for: indexPath) as? TableItemCell else {
                    return UITableViewCell()
                }
            cell.configure(with: item)
            return cell
            case .switcher(item: let item):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableItemCellSwitcher.identifier,
                    for: indexPath) as? TableItemCellSwitcher else {
                        return UITableViewCell()
                    }
                cell.configure(with: item)
                return cell
            case .description(item: let item):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableItemCellDescription.identifier,
                    for: indexPath) as? TableItemCellDescription else {
                        return UITableViewCell()
                    }
                cell.configure(with: item)
                return cell
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = items[indexPath.section].items[indexPath.row]
        switch type.self {
            case .simple(let item):
                item.action()
            case .switcher(let item):
                item.action()
            case .description(let item):
                item.action()
        }
    }
}
