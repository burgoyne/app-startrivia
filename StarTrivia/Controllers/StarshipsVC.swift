//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Andre Burgoyne on 2018-09-21.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    //outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var hyperRatingLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var pxLbl: UILabel!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var person: Person!
    let api = StarshipApi()
    var starships = [String]()
    var currentStarship = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        nextBtn.isEnabled = starships.count > 1
        prevBtn.isEnabled = false
        guard let firstStarship = starships.first else { return }
        getStarship(url: firstStarship)
    }
    
    func getStarship(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: Starship) {
        nameLbl.text = starship.name.lowercased()
        modelLbl.text = starship.model.lowercased()
        makerLbl.text = starship.manufacturer.lowercased()
        hyperRatingLbl.text = starship.rating.lowercased()
        costLbl.text = starship.cost.lowercased()
        lengthLbl.text = starship.length.lowercased()
        speedLbl.text = starship.speed.lowercased()
        crewLbl.text = starship.crew.lowercased()
        pxLbl.text = starship.passengers.lowercased()
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starships.count - 1 ? false : true
        prevBtn.isEnabled = currentStarship == 0 ? false : true
        
        getStarship(url: starships[currentStarship])
    }
}
