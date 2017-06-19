//
//  SourDough.swift
//  SoughDoughCal
//
//  Created by Cameron Steer on 19/06/2017.
//  Copyright © 2017 Cameron Steer. All rights reserved.
//

import Foundation


class SourDough: NSObject{
    var flour: Float = 0
    var water: Float = 0
    var starter: Float = 0
    var starterHydration: Float = 0
    
    init(flour: Float, water: Float, starter: Float, starterHydration: Float) {
        super.init()
        self.flour = flour
        self.water = water
        self.starter = starter
        self.starterHydration = starterHydration
    }
    
    
    func calHyrdation() -> Float {
        let h = roundf(((water + getStarterWater()) / (flour + getStarterFlour())*100))
        if (!h.isNaN){
            return h
        }
        return 0
    }
    
    func calWeight() -> Float {
        return flour+water+starter
    }
    
    func calSalt() -> Float {
        return round(calWeight()*0.011)
    }
    
    func getStarterFlour() -> Float {
        return (starter / (1+(starterHydration/100)))
    }
    
    func getStarterWater() -> Float {
        return starter - getStarterFlour()
    }
    
    override var description: String {
        return "flour: \(flour)" +
            "water: \(water)" +
            "starter: \(starter)" +
            "starterHydration: \(starterHydration)"
    }
    
}
