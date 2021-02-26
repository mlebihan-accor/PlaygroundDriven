//
//  FormTableViewController.swift
//  Form
//
//  Created by mlebihan on 26/02/2021.
//

import UIKit

public class FormTableViewController: UITableViewController {

  // MARK: - Properties
  
  private let sections: [FormSection] = [FormSection(title: "Info", rows: [FormRow(value: "Name"),
                                                                           FormRow(value: "tel"),
                                                                           FormRow(value: "Street")]),
                                         FormSection(title: "Ronaël", rows: [FormRow(value: "Pierre"),
                                                                              FormRow(value: "Morgan"),
                                                                              FormRow(value: "Maxime")])]
  
  // MARK: - Lifecycle
  
  public override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    tableView.backgroundColor = .darkGray
  }

  // MARK: - Table view data source

  public override func numberOfSections(in tableView: UITableView) -> Int {

    return sections.count
  }

  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return sections[section].rows.count
  }

  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

    let formRow = sections[indexPath.section].rows[indexPath.row]
    cell.textLabel?.text = formRow.value

    return cell
  }

  public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    sections[section].title
  }
}

// MARK: - Row

public struct FormRow {
  var value: String
}

// MARK: - Section

public struct FormSection {
  var title: String
  var rows: [FormRow]
}
