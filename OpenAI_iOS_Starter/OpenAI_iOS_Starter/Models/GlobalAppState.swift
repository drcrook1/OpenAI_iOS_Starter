//
//  GlobalAppState.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/14/23.
//

import Foundation

class GlobalAppState : ObservableObject {
    @Published var excursions: [Excursion]

    init(excursions: [Excursion] = Excursion.sampleData) {
            self.excursions = excursions
        }
}
