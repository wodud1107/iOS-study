//
//  ViewController.swift
//  TextViewInTableViewCell
//
//  Created by 김재영 on 9/25/25.
//

import UIKit

class ViewController: UITableViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
    }
    
    private func setupTextView() {
        textView.delegate = self
        textView.isScrollEnabled = false
    }

    func textViewDidChange(_ textView: UITextView) {
        tableView.performBatchUpdates(nil)
    }
}

