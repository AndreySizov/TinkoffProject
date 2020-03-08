//
//  TableViewAdapter.swift
//  GenericTableTest
//
//  Created by Андрей on 03/03/2020.
//  Copyright © 2020 AnSiz. All rights reserved.
//

import UIKit

// MARK: - Section
protocol SectionModel {
    var count: Int { get }

    func cell(at: Int) -> UITableViewCell
    func selected(at: Int)
}

// MARK: - Adapter
class Adapter: NSObject {
    let sections: [SectionModel]

    init(sections: [SectionModel]) {
        self.sections = sections
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension Adapter: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        return section.cell(at: indexPath.row)
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        section.selected(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

// MARK: - GenericSectionModel
class GenericSectionModel<Model, Cell>: SectionModel where Cell: UITableViewCell, Cell: Adaptable, Cell.Model == Model {
    
    // MARK: - Properties
    typealias ModelCellClosure = (Model, Cell) -> ()

    private let items: [Model]
    private lazy var cells: [Cell] = self.createCells()

    var onSelected: ModelCellClosure? = nil
    
    // MARK: - Protocol properties
    var count: Int {
        return items.count
    }

    // MARK: - Init
    init(items: [Model]) {
        self.items = items
    }
    
    // MARK: - Local functions
    func createCells() -> [Cell] {
        return items.map { m in
            let c = Cell.init(style: .default, reuseIdentifier: "some")
            c.adapt(model: m)
            return c
        }
    }

    // MARK: - Protocol functions
    func cell(at: Int) -> UITableViewCell {
        return cells[at]
    }

    func selected(at: Int) {
        let m = items[at]
        let c = cells[at]
        onSelected?(m, c)
    }
}

// MARK: - setAdapter
extension UITableView {
    func setAdapter(_ adapter: Adapter) {
        dataSource = adapter
        delegate = adapter
        reloadData()
    }
}

