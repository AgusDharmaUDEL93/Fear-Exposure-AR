//
//  PhobiaData.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import RealityKit

let phobiasData : [Phobia] = [
    Phobia(
        id: 0,
        name: "Ophidiophobia",
        displayName: "Snakes",
        isAnimal: true,
        description: "Intense fear of Snakes",
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "base_snake.usdz"),
            animation: try? ModelEntity.loadModel(named: "animation_snake.usdz").availableAnimations.first
        )
    ),
    Phobia(
        id: 1,
        name: "Katsaridaphobia",
        displayName: "Cockroaches",
        isAnimal: true,
        description: "Intense fear of Cockroaches",
        fearedObject: FearedObject()
    ),
    Phobia(
        id: 2,
        name: "Cynophobia",
        displayName: "Dog",
        isAnimal: true,
        description: "Intense fear of Dog",
        fearedObject: FearedObject()
    ),
    Phobia(
        id: 3,
        name: "Herpetophobia",
        displayName: "Crocodile",
        isAnimal: true,
        description: "Intense fear of Crocodile",
        fearedObject: FearedObject()
    ),
    Phobia(
        id: 4,
        name: "Globophobia",
        displayName: "Balloon",
        isAnimal: false,
        description: "Intense fear of Balloon",
        fearedObject: FearedObject()
    ),
    Phobia(
        id: 5,
        name: "Arachnophobia",
        displayName: "Spiders",
        isAnimal: true,
        description: "Intense fear of Spiders",
        fearedObject: FearedObject()
    ),
    Phobia(
        id: 6,
        name: "Herpetophobia",
        displayName: "Gecko",
        isAnimal: true,
        description: "Intense fear of Gecko",
        fearedObject: FearedObject()
    ),
]