//
//  ViewController.swift
//  RxSwift-TableView
//
//  Created by Nicholas Tian on 6/04/2016.
//  Copyright © 2016 nicktd. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let items = Observable.just([
            "First Item",
            "Second Item",
            "Third Item"
            ])

        items
            .bindTo(tableView.rx_itemsWithCellIdentifier("Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element) @ row \(row)"
            }
            .addDisposableTo(disposeBag)
    }
}

