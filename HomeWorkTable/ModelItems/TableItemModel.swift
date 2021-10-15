//
//  TableItemModel.swift
//  HomeWorkTable
//
//  Created by Александр Горденко on 15.10.2021.
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
