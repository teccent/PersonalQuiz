//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChoosen: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        animalDefinition()
    }
    
    private func animalDefinition() {
        var totalMark = [AnimalType: Int]()
        
        for answer in answersChoosen {
            totalMark[answer.type, default: 0] += 1
        }
        
        let userResult = totalMark.first { $0.value == totalMark.values.max() }
        if let type = userResult?.key { showResult(type: type)}
    }
    
    private func showResult(type: AnimalType) {
        resultLabel.text = "Вы - \(type.rawValue)"
        descriptionLabel.text = type.definition
    }

}
