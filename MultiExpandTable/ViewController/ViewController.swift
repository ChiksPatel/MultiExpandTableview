//
//  ViewController.swift
//  MultiExpandTable
//
//  Created by Chirag on 14/10/19.
//  Copyright © 2019 Chirag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tblCustomExpand : UITableView!
    
    var innerIndexExpand = Int()
    var isInnerRowSelected = Bool()
    var isInnerRow = Int()
    var isInnerRowSection = Int()
    
    var arrHeaderSection = [String]()
    var arrCell = [String]()
    var arrInnerCell = [String]()
    
    var isSectionClick = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        innerIndexExpand = 1000
        
        arrHeaderSection = ["Section1","Section2","Section3","Section4","Section5"];
        arrCell = ["Cell1","Cell2","Cell3","Cell4"];
        arrInnerCell = ["InnerCell1","InnerCell2"];
        
        tblCustomExpand.register(UINib(nibName: "HeaderSectionCell", bundle: nil), forCellReuseIdentifier: "HeaderSectionCell")
        
        tblCustomExpand.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSectionClick == true {
            if innerIndexExpand == section {
              return arrCell.count
            }
            return 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : CustomCell  = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.cellViewHeightConstraint.constant = 44
        if isInnerRowSelected == true {
            if isInnerRowSection == indexPath.section && isInnerRow == indexPath.row {
                cell.initTableviewSetUp(withInnerArray:arrInnerCell)
                cell.cellViewHeightConstraint.constant = CGFloat(44 * arrInnerCell.count) + 75
            }
        }
        cell.lblName.text = "\(arrCell[indexPath.row])"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrHeaderSection.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isInnerRowSelected = true
        isInnerRow = indexPath.row
        isInnerRowSection = indexPath.section
        tblCustomExpand.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let indexPath = IndexPath(row: 0, section: section)
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderSectionCell", for: indexPath) as! HeaderSectionCell
        headerCell.lblHeaderName.text = "Index : \(arrHeaderSection[section])"
        headerCell.btnSelection.tag = indexPath.section
        headerCell.btnSelection.addTarget(self, action: #selector(btnMainCategoryTapped_Action(btnSection:)), for: .touchUpInside)
        headerCell.selectionStyle = .none
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    @objc func btnMainCategoryTapped_Action(btnSection:UIButton) {
        isSectionClick = true
        innerIndexExpand = btnSection.tag
        tblCustomExpand.reloadData()
    }
}

