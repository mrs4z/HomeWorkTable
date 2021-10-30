//
//  SettingsController.swift
//  HomeWorkTable
//
//  Created by Александр Горденко on 14.10.2021.
//

import UIKit

final class SettingsController: UIViewController {
    private var settingsModel: SettingsModel?
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return (view as? SettingsView)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        settingsModel = SettingsModel()
        view = SettingsView()
        configureView()
    }
}

private extension SettingsController {
    func configureView() {
        guard let items = settingsModel?.getItems() else {
            return
        }
        settingsView?.configureView(model: items)
    }
}

