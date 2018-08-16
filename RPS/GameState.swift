//
//  GameState.swift
//  RPS
//
//  Created by José Gil Ramírez S on 11/08/18.
//  Copyright © 2018 José Gil Ramírez S. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    var status: String {
        switch self {
        case .start: return "¿Piedra, Papel o Tijeras?"
        case .win: return "Tú ganas!!!"
        case .lose: return "Tú pierdes!!!"
        case .draw: return "Empatamos!!!"
        }
    }
}
