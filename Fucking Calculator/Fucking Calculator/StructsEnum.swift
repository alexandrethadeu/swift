//
//  StructsEnum.swift
//  Fucking Calculator
//
//  Created by Alexandre Thadeu Peres da SIlva on 5/25/17.
//  Copyright © 2017 Alexandre Thadeu Peres da SIlva. All rights reserved.
//

import Foundation

enum Operator: String {
    case Add = "+"
    case Subtract = "-"
    case Tunes = "*"
    case Divide = "/"
    case Nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
