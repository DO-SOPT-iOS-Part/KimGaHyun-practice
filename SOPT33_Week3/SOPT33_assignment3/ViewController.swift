//
//  ViewController.swift
//  SOPT33_assignment3
//
//  Created by Gahyun Kim on 2023/10/28.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.setTableViewConfig()
    }
    
    
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.tableView.register(ItemListTableViewCell.self,
                                forCellReuseIdentifier: ItemListTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .init(red: 33.0 / 255.0,
                                   green: 33.0 / 255.0,
                                   blue: 33.0 / 255.0,
                                   alpha: 1.0)
        $0.separatorColor = .lightGray
        $0.separatorStyle = .singleLine
    }
 
}
extension ViewController: UITableViewDelegate {}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.identifier,
            for: indexPath) as? ItemListTableViewCell else {return UITableViewCell()}
        
//        cell.likeTapCompletion = { [weak self] state in
//            guard let self else {return}
//            itemListData[indexPath.row].isLike = state
//        }
//
        cell.bindData(data: itemListData[indexPath.row])
        return cell
    }
}


