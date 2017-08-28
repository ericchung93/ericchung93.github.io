//
//  PenguStats.swift
//  HangMan
//
//  Created by Eric Chung on 8/11/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

class PenguStats: NSObject {
    var gamesPlayed = 0
    var highestStage = 0
    var penguPoints = 0
    var gamesWon = 0
    var stage1Complete = false
    var stage2Complete = false
    var stage3Complete = false
    var stage4Complete = false
    var stage5Complete = false
    var stage6Complete = false
    var stage7Complete = false
    var stage8Complete = false
    var stage9Complete = false
    var stage10Complete = false
    var stage11Complete = false
    var stage12Complete = false
    var stage13Complete = false
    var stage14Complete = false
    var stage15Complete = false

    init(gamesPlayed: Int, highestStage: Int, penguPoints: Int, gamesWon: Int, stage1Complete: Bool, stage2Complete: Bool, stage3Complete: Bool, stage4Complete: Bool, stage5Complete: Bool, stage6Complete: Bool, stage7Complete: Bool, stage8Complete: Bool, stage9Complete: Bool, stage10Complete: Bool, stage11Complete: Bool, stage12Complete: Bool, stage13Complete: Bool, stage14Complete: Bool, stage15Complete: Bool) {
        self.gamesPlayed = gamesPlayed
        self.highestStage = highestStage
        self.penguPoints = penguPoints
        self.gamesWon = gamesWon
        self.stage1Complete = stage1Complete
        self.stage2Complete = stage2Complete
        self.stage3Complete = stage3Complete
        self.stage4Complete = stage4Complete
        self.stage5Complete = stage5Complete
        self.stage6Complete = stage6Complete
        self.stage7Complete = stage7Complete
        self.stage8Complete = stage8Complete
        self.stage9Complete = stage9Complete
        self.stage10Complete = stage10Complete
        self.stage11Complete = stage11Complete
        self.stage12Complete = stage12Complete
        self.stage13Complete = stage13Complete
        self.stage14Complete = stage14Complete
        self.stage15Complete = stage15Complete

    }
}
