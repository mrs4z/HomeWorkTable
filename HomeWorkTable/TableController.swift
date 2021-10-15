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

struct TableItemDescription {
    let title: String
    var description: String
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
    case description(item: TableItemDescription)
}

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
        // general
        items.append(TableCategorie(items: [
            .switcher(item: TableItemSwitcher(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBg: .systemOrange, state: false) {
                print("CLICK")
            }),
            .description(item: TableItemDescription(title: "Wi-Fi", description: "Не подключено", icon: UIImage(systemName: "wifi"), iconBg: .systemBlue) {
                print("CLICK")
            }),
            .description(item: TableItemDescription(title: "Bluetooth", description: "Вкл.", icon: UIImage(systemName: "iphone.homebutton.radiowaves.bluetooth"), iconBg: .systemBlue) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBg: .systemGreen) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBg: .systemGreen) {
                print("CLICK")
            })
        ]))
        
        items.append(TableCategorie(items: [
            .simple(item: TableItemSimple(title: "Уведомления", icon: UIImage(systemName: "bell"), iconBg: .systemRed) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3"), iconBg: .systemRed) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Фокусирование", icon: UIImage(systemName: "moon.fill"), iconBg: .systemIndigo) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBg: .systemIndigo) {
                print("CLICK")
            }),
        ]))
        
        items.append(TableCategorie(items: [
            .simple(item: TableItemSimple(title: "Основные", icon: UIImage(systemName: "gear"), iconBg: .systemGray) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconBg: .systemGray) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBg: .systemBlue) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Экран «Домой»", icon: UIImage(systemName: "house.fill"), iconBg: .systemIndigo) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Универсальный доступ", icon: UIImage(systemName: "figure.wave.circle"), iconBg: .systemBlue) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Обои", icon: UIImage(systemName: "newspaper.fill"), iconBg: .systemCyan) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Siri и Поиск", icon: UIImage(systemName: "magnifyingglass"), iconBg: .systemIndigo) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "FaceID и код-пароль", icon: UIImage(systemName: "faceid"), iconBg: .systemGreen) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Экстренный вызов - SOS", icon: UIImage(systemName: "questionmark.circle.fill"), iconBg: .systemRed) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Уведомления о контакте", icon: UIImage(systemName: "staroflife.fill"), iconBg: .systemBrown) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Аккумулятор", icon: UIImage(systemName: "battery.100"), iconBg: .systemGreen) {
                print("CLICK")
            }),
            .simple(item: TableItemSimple(title: "Конфиденциальность", icon: UIImage(systemName: "hand.raised.fill"), iconBg: .systemBlue) {
                print("CLICK")
            }),
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
