//
//  DetailViewController.swift
//  TestCoordinator
//
//  Created by 김재영 on 9/18/25.
//

import UIKit

class DetailViewController: UIViewController {
    private let fruitName: String

    init(fruitName: String) {
        self.fruitName = fruitName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "상세 정보"

        let label = UILabel()
        label.text = "선택한 과일: \(fruitName)"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
