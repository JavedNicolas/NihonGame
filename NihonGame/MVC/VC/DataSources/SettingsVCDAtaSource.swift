//
//  SettingsVCDataSource.swift
//  NihonGame
//
//  Created by Nicolas on 12/10/2018.
//  Copyright © 2018 Nicolas. All rights reserved.
//

import UIKit

extension SettingsViewController : UITableViewDataSource {
    /** get section header name from the settings list */
    func getSectionsHeaders() -> [String]{
        var sectionHeaders = [String]()
        for settings in settingsList {
            if !sectionHeaders.contains(where: { $0 == settings.sectionName }) {
                sectionHeaders.append(settings.sectionName)
            }
        }
        return sectionHeaders
    }

    /** get settings from the setting list for a specific id*/
    func getSettingsForSection(id: Int) -> [SettingsElement] {
        var settingsListForSection = [SettingsElement]()
        for settings in settingsList {
            if settings.sectionId == id {
                settingsListForSection.append(settings)
            }
        }
        return settingsListForSection
    }

    // MARK:- Table View Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getSectionsHeaders()[section]
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = (view as? UITableViewHeaderFooterView), let background = header.backgroundView,
            let textlabel = header.textLabel else {
                return
        }
        background.backgroundColor = DesignConstant.black5Alpha
        textlabel.textColor = .white
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return getSectionsHeaders().count
    }

    // MARK:- settings cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsForSectionName = getSettingsForSection(id: indexPath.section)
        return settingsForSectionName[indexPath.row].cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let settingsForSectionName = getSettingsForSection(id: section)
        return settingsForSectionName.count
    }
    
}

