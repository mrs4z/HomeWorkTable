//
//  TableView.swift
//  HomeWorkTable
//
//  Created by Александр Горденко on 30.10.2021.
//

import UIKit

class SettingsView: UIView {
    
    var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: UITableView.Style.grouped)
        table.register(SettingsItemCellView.self, forCellReuseIdentifier: SettingsItemCellView.identifier)
        table.register(SettingsItemCellSwitcherView.self, forCellReuseIdentifier: SettingsItemCellSwitcherView.identifier)
        table.register(SettingsItemCellDescriptionView.self, forCellReuseIdentifier: SettingsItemCellDescriptionView.identifier)
        return table
    }()
    
    var models: [TableCategorie] = []
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = UIColor.white
        
        configure()
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("SettingsView error coder")
    }
    
    func configureView(model: [TableCategorie]) {
        models = model
    }
    
    func setupView() {
        addSubview(tableView)
    }
    
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
}

private extension SettingsView {
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SettingsView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = models[indexPath.section].items[indexPath.row]

        switch type.self {
            case .simple(item: let item):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsItemCellView.identifier,
                for: indexPath) as? SettingsItemCellView else {
                    return UITableViewCell()
                }
            cell.configure(with: item)
            return cell
            case .switcher(item: let item):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SettingsItemCellSwitcherView.identifier,
                    for: indexPath) as? SettingsItemCellSwitcherView else {
                        return UITableViewCell()
                    }
                cell.configure(with: item)
                return cell
            case .description(item: let item):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SettingsItemCellDescriptionView.identifier,
                    for: indexPath) as? SettingsItemCellDescriptionView else {
                        return UITableViewCell()
                    }
                cell.configure(with: item)
                return cell

        }
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].items[indexPath.row]
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
