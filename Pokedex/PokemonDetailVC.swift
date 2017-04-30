//
//  PokemonDetailVCViewController.swift
//  Pokedex
//
//  Created by Jamel Reid  on 4/29/17.
//  Copyright © 2017 Jamel Reid . All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        
        let pokemonImage = UIImage(named: "\(pokemon.pokedexId).png")
        mainImage.image = pokemonImage
        currentEvoImage.image = pokemonImage
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetails {
            
            // Will be called after the network call is complete!
            
            print("================>")
            
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImage.isHidden = true
        } else {
            nextEvoImage.image = UIImage(named: "\(pokemon.nextEvolutionId).png")
            evoLbl.text = pokemon.nexEvolutionTxt
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
