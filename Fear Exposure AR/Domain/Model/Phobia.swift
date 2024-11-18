//
//  Phobias.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import RealityKit

struct Phobia {
    let id : Int
    let name : String
    let displayName : String
    let image : String
    let image_nobg : String
    let description : String
    var fearedObject : FearedObject
    
    static let initial = Phobia(
        id: 0,
        name: "Ophidiophobia",
        displayName: String(localized: "Snake"),
        image: "image/illustration/phobia/balloon",
        image_nobg: "image/illustration/phobia/nobg/snake_nobg",
        description: String(localized: "Intense fear of Snake"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "snake.usdz"),
            animation: try? ModelEntity.loadModel(named: "snake.usdz").availableAnimations.first,
            image: [
                "image/data/snake/snake1",
                "image/data/snake/snake2",
                "image/data/snake/snake3"
            ],
            audio: try? AudioFileResource.load(
                named: "snake.m4a",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .stream,
                shouldLoop: true
            )
        )
    )
}
