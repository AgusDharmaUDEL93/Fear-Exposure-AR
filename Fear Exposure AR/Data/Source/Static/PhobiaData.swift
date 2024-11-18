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
        image: "image/illustration/phobia/bg/snake",
        image_nobg: "image/illustration/phobia/nobg/snake_nobg",
        description: String(localized: "Intense fear of Snake"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "snake.usdz"),
            animation: try? ModelEntity.loadModel(named: "snake.usdz").availableAnimations.first,
            image: [
                "image/therapy/snake/snake1",
                "image/therapy/snake/snake2",
                "image/therapy/snake/snake3"
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
        image: "image/illustration/phobia/bg/dog",
        image_nobg: "image/illustration/phobia/nobg/dog_nobg",
        description: String(localized: "Intense fear of Dog"),
        fearedObject:  FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "dog.usdz"),
            animation: try? ModelEntity.loadModel(named: "dog.usdz").availableAnimations.first,
            image: [
                "image/therapy/dog/dog1",
                "image/therapy/dog/dog2",
                "image/therapy/dog/dog3"
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
        image: "image/illustration/phobia/bg/crocodile",
        image_nobg: "image/illustration/phobia/nobg/crocodile_nobg",
        description: String(localized: "Intense fear of Crocodile"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "crocodile.usdz"),
            animation: try? ModelEntity.loadModel(named: "crocodile.usdz").availableAnimations.first,
            image: [
                "image/therapy/crocodile/crocodile1",
                "image/therapy/crocodile/crocodile2",
                "image/therapy/crocodile/crocodile3"
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
        name: "Arachnophobia",
        displayName: String(localized: "Spider"),
        image: "image/illustration/phobia/bg/spider",
        image_nobg: "image/illustration/phobia/nobg/spider_nobg",
        description: String(localized: "Intense fear of Spider"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "spider.usdz"),
            animation: try? ModelEntity.loadModel(named: "spider.usdz").availableAnimations.first,
            image: [
                "image/therapy/spider/spider1",
                "image/therapy/spider/spider2",
                "image/therapy/spider/spider3"
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
        id: 4,
        name: "Herpetophobia",
        displayName: String(localized: "Gecko") ,
        image: "image/illustration/phobia/bg/gecko",
        image_nobg: "image/illustration/phobia/nobg/gecko_nobg",
        description: String(localized: "Intense fear of Gecko") ,
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "gecko.usdz"),
            animation: try? ModelEntity.loadModel(named: "gecko.usdz").availableAnimations.first,
            image: [
                "image/therapy/gecko/gecko1",
                "image/therapy/gecko/gecko2",
                "image/therapy/gecko/gecko3"
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
        id: 5,
        name: "Katsaridaphobia",
        displayName: String(localized: "Cockroach"),
        image: "image/illustration/phobia/bg/cockroach",
        image_nobg: "image/illustration/phobia/nobg/cockroach_nobg",
        description: String(localized: "Intense fear of Cockroach"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "cockroach.usdz"),
            animation: try? ModelEntity.loadModel(named: "cockroach.usdz").availableAnimations.first,
            image: [
                "image/therapy/cockroach/cockroach1",
                "image/therapy/cockroach/cockroach2",
                "image/therapy/cockroach/cockroach3"
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
        id: 6,
        name: "Ailurophobia",
        displayName: String(localized: "Cat") ,
        image: "image/illustration/phobia/bg/cat",
        image_nobg: "image/illustration/phobia/nobg/cat_nobg",
        description: String(localized: "Intense fear of Cat"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "cat.usdz"),
            animation: try? ModelEntity.loadModel(named: "cat.usdz").availableAnimations.first,
            image: [
                "image/therapy/cat/cat1",
                "image/therapy/cat/cat2",
                "image/therapy/cat/cat3"
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
        id: 7,
        name: "Musophobia",
        displayName: String(localized: "Rat"),
        image: "image/illustration/phobia/bg/rat",
        image_nobg: "image/illustration/phobia/nobg/rat_nobg",
        description: String(localized: "Intense fear of Rat"),
        fearedObject: FearedObject(
            baseModel: try? ModelEntity.loadModel(named: "rat.usdz"),
            animation: try? ModelEntity.loadModel(named: "rat.usdz").availableAnimations.first,
            image: [
                "image/therapy/rat/rat1",
                "image/therapy/rat/rat2",
                "image/therapy/rat/rat3"
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
