//
//  ViewController.swift
//  StarTrivia
//
//  Created by Andre Burgoyne on 2018-09-14.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    //variables
    var personApi = PersonApi()

    override func viewDidLoad() {
        super.viewDidLoad()
        personApi.getRandomPersonUrlSession()
    }
}

