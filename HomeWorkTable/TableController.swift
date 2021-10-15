//
//  TableController.swift
//  HomeWorkTable
//
//  Created by Александр Горденко on 14.10.2021.
//

import UIKit

struct TableCategorie {
    let items: [TableItemType]
}

struct TableItemSimple {
    let title: String
    let icon: UIImage?
    let iconBg: UIColor
    let action: (() -> Void)
}

struct TableItemSwitcher {
    let title: String
    let icon: UIImage?
    let iconBg: UIColor
    var state: Bool
    let action: (() -> Void)
}

enum TableItemType {
    case simple(item: TableItemSimple)
    case switcher(item: TableItemSwitcher)
}

final class TableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: UITableView.Style.grouped)
        table.register(TableItemCell.self, forCellReuseIdentifier: TableItemCell.identifier)
        table.register(TableItemCellSwitcher.self, forCellReuseIdentifier: TableItemCellSwitcher.identifier)
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
        // general
        items.append(TableCategorie(items: [
            .switcher(item: TableItemSwitcher(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBg: .systemOrange, state: false) {
                print("CLICK TEST")
            })
        ]))
        
        items.append(TableCategorie(items: [
            .simple(item: TableItemSimple(title: "Уведомления", icon: UIImage(systemName: "bell"), iconBg: .systemRed) {
                print("CLICK TEST")
            })
        ]))
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
        }
    }
}
