//
//  TableModel.swift
//  HomeWorkTable
//
//  Created by Александр Горденко on 30.10.2021.
//

import UIKit

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

struct TableCategorie {
    let items: [TableItemType]
}


enum TableItemType {
    case simple(item: TableItemSimple)
    case switcher(item: TableItemSwitcher)
    case description(item: TableItemDescription)
}

class SettingsModel {
    func getItems() -> [TableCategorie] {
        return [
            TableCategorie(items: [
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
                }),
                .switcher(item: TableItemSwitcher(title: "VPN", icon: UIImage(systemName: "vpn"), iconBg: .systemBlue, state: false) {
                    print("CLICK")
                }),
            ]),
            TableCategorie(items: [
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
            ]),
            TableCategorie(items: [
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
            ])
        ]
    }
}
