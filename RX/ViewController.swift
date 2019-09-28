//
//  ViewController.swift
//  RX
//
//  Created by mohamed hashem on 9/26/19.
//  Copyright © 2019 mohamed hashem. All rights reserved.
//

import UIKit
import RxSwift

struct MainStruct {
    var name: String?
    var password: String?
    var date: Date?
}

protocol testMockLogin {
    func runLog(password: String, name: String, completionHanbdelar: @escaping ((Bool)-> Void))
}

class ViewController: UIViewController {

    var dataModel: MainStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func runtestMainModel(data: MainStruct) -> String {
        guard let data = data.name else {
            return "MY Name is: Not found"
        }
        return "MY Name is: \(data)"
    }

}

extension ViewController: testMockLogin {
    func runLog(password: String, name: String, completionHanbdelar: @escaping ((Bool) -> Void)) {
        let newDataModel = MainStruct(name: name, password: password, date: Date())
        self.dataModel = newDataModel
    }
}


