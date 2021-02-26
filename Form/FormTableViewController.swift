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

    let nib = UINib(nibName: "FormTableViewCell", bundle: Bundle(for: FormTableViewCell.self))
    tableView.register(nib, forCellReuseIdentifier: "reuseIdentifier")
    tableView.backgroundColor = .clear
    view.backgroundColor = .clear

    tableView.layer.borderColor = UIColor.black.cgColor
    tableView.layer.borderWidth = 1

    self.tableView.tableFooterView = UIView()
  }

  // MARK: - Table view data source

  public override func numberOfSections(in tableView: UITableView) -> Int {

    return sections.count
  }

  public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    sections[section].rows.count
  }

  public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! FormTableViewCell

    let formRow = sections[indexPath.section].rows[indexPath.row]
    cell.set(text: formRow.value)
    cell.separatorInset = UIEdgeInsets(top: 0,
                                       left: 16,
                                       bottom: 0,
                                       right: 16)

    /* hide separator
     self.tableView.separatorColor = self.tableView.backgroundColor
     */



    switch indexPath.row {
    case 0:
      cell.setBorder()
      cell.setTopRadius(25.0)
    case sections[indexPath.section].rows.count - 1:
      cell.setBottomRadius(5.0)
    default:
      cell.removeRadius()
    }

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
