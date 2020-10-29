//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 31.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        showResult()

    }
}

extension ResultsViewController {
    private func showResult() {
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = answers.map { $0.type }
        
        for animal in animals {
            if let animalTipecount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTipecount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
       
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value}
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else {return}
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        animalLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}



