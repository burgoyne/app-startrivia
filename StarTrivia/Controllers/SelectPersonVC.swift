//
//  ViewController.swift
//  StarTrivia
//
//  Created by Andre Burgoyne on 2018-09-14.
//  Copyright © 2018 Andre Burgoyne. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    //outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    //variables
    var personApi = PersonApi()
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        personApi.getRandomPersonAlamo(id: random) { (person) in
            if let person = person {
                self.SetupView(person: person)
                self.person = person
            }
        }
    }
    
    func SetupView(person: Person) {
        nameLbl.text = person.name.lowercased()
        heightLbl.text = person.height.lowercased()
        massLbl.text = person.mass.lowercased()
        hairLbl.text = person.hair.lowercased()
        birthYearLbl.text = person.birthYear.lowercased()
        genderLbl.text = person.gender.lowercased()
        
        homeworldBtn.isEnabled = !person.homeworldUrls.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
    }
}

protocol PersonProtocol {
    var person: Person! {get set}
}

