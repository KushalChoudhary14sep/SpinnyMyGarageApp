//
//  DashboardVC.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation
import UIKit

protocol DashboardView: AnyObject {
    var logoutButton: Button! { get set }
    var selectMakeDropDowntextField: TextField! { get set }
    var selectModelDropDownTextField: TextField! { get set }
    var addCarButton: UIButton! { get set }
    var tableView: UITableView! { get set }
    var carMakeResponse: CarMakeResponse? { get set }
    var carModelResponse: CarModelResponse? { get set }
    var carList: [Car]? { get set }
}

class DashboardViewController: UIViewController, DashboardView {
    @IBOutlet weak var logoutButton: Button!
    @IBOutlet weak var selectMakeDropDowntextField: TextField!
    @IBOutlet weak var selectModelDropDownTextField: TextField!
    @IBOutlet weak var addCarButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    private var dashboardUIController: DashboardUIController?
    private var dashboardViewModel: DashboardViewModel?
    var carMakeResponse: CarMakeResponse?
    var carModelResponse: CarModelResponse?
    var carList: [Car]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dashboardUIController = DashboardUIController()
        dashboardUIController?.view = self
        self.dashboardViewModel = DashboardViewModel()
        dashboardViewModel?.view = self
        dashboardUIController?.delegate = dashboardViewModel
        dashboardViewModel?.delegate = dashboardUIController
        dashboardUIController?.fetchCarListDelegate = dashboardViewModel
        dashboardViewModel?.carlistDelegate = dashboardUIController
    }
}
