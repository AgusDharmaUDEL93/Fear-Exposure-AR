//
//  Result.swift
//  Fear Exposure AR
//
//  Created by Putu Agus Dharma Kusuma on 15/11/24.
//

enum Result<T> {
    case success(data : T)
    case error (message : String)
}
