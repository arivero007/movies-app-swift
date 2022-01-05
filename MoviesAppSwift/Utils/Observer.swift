//
//  Box.swift
//  MoviesAppSwift
//
//  Created by AlexR on 5/1/22.
//

import Foundation

typealias observerType<T> = (T?) -> ()

class Observer<T> {
    var value: T{
        didSet{
            self.observerBlock?(value)
        }
    }
    
    private var observerBlock: observerType<T>?

    init(value: T){
        self.value = value
    }
    
    func addObserver(_ observer: @escaping observerType<T>){
        self.observerBlock = observer
    }
    
}
