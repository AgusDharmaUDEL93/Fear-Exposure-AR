//
//  PhobiaData.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 07/11/24.
//

import RealityKit
import Foundation

let phobiasData : [Phobia] = [
    Phobia(
        id: 0,
        name: "Ophidiophobia",
        displayName: String(localized: "Snake"),
        image: "image/illustration/phobia/snake",
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
    ),
    Phobia(
        id: 1,
        name: "Cynophobia",
        displayName: String(localized: "Dog"),
        image: "image/illustration/phobia/dog",
        description: String(localized: "Intense fear of Dog"),
        fearedObject:  FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "dog.usdz"),
            animation: try? ModelEntity.loadModel(named: "dog.usdz").availableAnimations.first,
            image: [
                "image/data/dog/dog1",
                "image/data/dog/dog2",
                "image/data/dog/dog3"
            ],
            audio: try? AudioFileResource.load(
                named: "dog.m4a",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .stream,
                shouldLoop: true
            )
        )
    ),
    Phobia(
        id: 2,
        name: "Herpetophobia",
        displayName: String(localized: "Crocodile"),
        image: "image/illustration/phobia/crocodile",
        description: String(localized: "Intense fear of Crocodile"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "crocodile.usdz"),
            animation: try? ModelEntity.loadModel(named: "crocodile.usdz").availableAnimations.first,
            image: [
                "image/data/crocodile/crocodile1",
                "image/data/crocodile/crocodile2",
                "image/data/crocodile/crocodile3"
            ],
            audio: try? AudioFileResource.load(
                named: "crocodile.m4a",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .stream,
                shouldLoop: true
            )
        )
    ),
    Phobia(
        id: 3,
        name: "Globophobia",
        displayName: String(localized: "Balloon"),
        image: "image/illustration/phobia/balloon",
        description: String(localized: "Intense fear of Balloon"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "ballon.usdz"),
            animation: try? ModelEntity.loadModel(named: "ballon.usdz").availableAnimations.first,
            image: [
                "image/data/balloon/balloon1",
                "image/data/balloon/balloon2",
                "image/data/balloon/balloon3"
            ],
            audio: try? AudioFileResource.load(
                named: "balloon.m4a",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .stream,
                shouldLoop: true
            )
        )
    ),
    Phobia(
        id: 4,
        name: "Arachnophobia",
        displayName: String(localized: "Spider"),
        image: "image/illustration/phobia/spider",
        description: String(localized: "Intense fear of Spider"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "spider.usdz"),
            animation: try? ModelEntity.loadModel(named: "spider.usdz").availableAnimations.first,
            image: [
                "image/data/spider/spider1",
                "image/data/spider/spider2",
                "image/data/spider/spider3"
            ],
            audio: try? AudioFileResource.load(
                named: "spider.m4a",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .stream,
                shouldLoop: true
            )
        )
    ),
    Phobia(
        id: 5,
        name: "Herpetophobia",
        displayName: String(localized: "Gecko") ,
        image: "image/illustration/phobia/gecko",
        description: String(localized: "Intense fear of Gecko") ,
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "gecko.usdz"),
            animation: try? ModelEntity.loadModel(named: "gecko.usdz").availableAnimations.first,
            image: [
                "image/data/gecko/gecko1",
                "image/data/gecko/gecko2",
                "image/data/gecko/gecko3"
            ],
            audio: try? AudioFileResource.load(
                named: "gecko.m4a",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .stream,
                shouldLoop: true
            )
        )
    ),
    Phobia(
        id: 6,
        name: "Katsaridaphobia",
        displayName: String(localized: "Cockroach"),
        image: "image/illustration/phobia/cockroach",
        description: String(localized: "Intense fear of Cockroach"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "cockroach.usdz"),
            animation: try? ModelEntity.loadModel(named: "cockroach.usdz").availableAnimations.first,
            image: [
                "image/data/cockroach/cockroach1",
                "image/data/cockroach/cockroach2",
                "image/data/cockroach/cockroach3"
            ],
            audio: try? AudioFileResource.load(
                named: "cockroach.m4a",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .stream,
                shouldLoop: true
            )
        )
    ),
    Phobia(
        id: 7,
        name: "Ailurophobia",
        displayName: String(localized: "Cat") ,
        image: "image/illustration/phobia/cat",
        description: String(localized: "Intense fear of Cat"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "cat.usdz"),
            animation: try? ModelEntity.loadModel(named: "cat.usdz").availableAnimations.first,
            image: [
                "image/data/cat/cat1",
                "image/data/cat/cat2",
                "image/data/cat/cat3"
            ],
            audio: try? AudioFileResource.load(
                named: "cat.m4a",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .stream,
                shouldLoop: true
            )
        )
    ),
    Phobia(
        id: 8,
        name: "Musophobia",
        displayName: String(localized: "Rat"),
        image: "image/illustration/phobia/rat",
        description: String(localized: "Intense fear of Rat"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "rat.usdz"),
            animation: try? ModelEntity.loadModel(named: "rat.usdz").availableAnimations.first,
            image: [
                "image/data/rat/rat1",
                "image/data/rat/rat2",
                "image/data/rat/rat3"
            ],
            audio: try? AudioFileResource.load(
                named: "rat.m4a",
                in: nil,
                inputMode: .spatial,
                loadingStrategy: .stream,
                shouldLoop: true
            )
        )
    )
]
