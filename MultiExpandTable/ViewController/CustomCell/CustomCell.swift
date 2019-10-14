//
//  CustomCell.swift
//  MultiExpandTable
//
//  Created by Chirag on 14/10/19.
//  Copyright © 2019 Chirag. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tblInnerRowCell: UITableView!
    @IBOutlet weak var cellViewHeightConstraint: NSLayoutConstraint!

    var arrInner = [String]()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initTableviewSetUp(withInnerArray:[String]) {
        tblInnerRowCell.register(UINib(nibName: "InnerCell", bundle: nil), forCellReuseIdentifier: "InnerCell")
        arrInner = withInnerArray
        tblInnerRowCell.reloadData()
    }
}

extension CustomCell : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrInner.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : InnerCell  = tableView.dequeueReusableCell(withIdentifier: "InnerCell", for: indexPath) as! InnerCell
        cell.lblInnerName.text = "\(arrInner[indexPath.row])"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("InnerIndexPath : \(indexPath.row)")
    }
    
    
}
