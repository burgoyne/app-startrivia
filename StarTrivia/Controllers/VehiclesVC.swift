//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Andre Burgoyne on 2018-09-21.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
    //outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var pxLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    let api = VehicleApi()
    var vehicles = [String]()
    var currentVehicle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        vehicles = person.vehicleUrls
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }
    
    func getVehicle(url: String) {
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func setupView(vehicle: Vehicle) {
        nameLbl.text = vehicle.name.lowercased()
        modelLbl.text = vehicle.model.lowercased()
        makerLbl.text = vehicle.manufacturer.lowercased()
        costLbl.text = vehicle.cost.lowercased()
        lengthLbl.text = vehicle.length.lowercased()
        speedLbl.text = vehicle.speed.lowercased()
        crewLbl.text = vehicle.crew.lowercased()
        pxLbl.text = vehicle.passengers.lowercased()
    }

    @IBAction func previousClicked(_ sender: Any) {
        currentVehicle -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentVehicle == vehicles.count - 1 ? false : true
        previousBtn.isEnabled = currentVehicle == 0 ? false : true
        
        getVehicle(url: vehicles[currentVehicle])
    }
}
