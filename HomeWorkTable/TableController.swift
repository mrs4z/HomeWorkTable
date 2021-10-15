//
//  TableController.swift
//  HomeWorkTable
//
//  Created by Александр Горденко on 14.10.2021.
//

import UIKit

struct TableItem {
    let title: String
    let icon: UIImage?
    let iconBg: UIColor
    let action: (() -> Void)
}

final class TableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: UITableView.Style.grouped)
        table.register(TableItemCell.self, forCellReuseIdentifier: TableItemCell.identifier)
        return table
    }()
    
    var items = [TableItem]()
    
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
        items = [
            TableItem(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBg: .systemOrange) {
                print("CLICK TEST")
            }
        ]
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TableItemCell.identifier,
            for: indexPath) as? TableItemCell else {
                return UITableViewCell()
            }
        
        cell.configure(with: item)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        item.action()
    }
}
