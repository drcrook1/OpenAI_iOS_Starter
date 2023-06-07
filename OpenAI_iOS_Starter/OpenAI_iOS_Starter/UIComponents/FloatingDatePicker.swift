//
//  FloatingDatePicker.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/7/23.
//

import Foundation
import SwiftUI

struct FloatingDatePicker: View {
    let title: String
    @Binding var date: Date

    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.accentColor)
                .offset(y: -40)
                .scaleEffect(0.75, anchor: .leading)
            DatePicker("Date", selection: $date, displayedComponents: [.date])
                .labelsHidden()
        }
        .padding(.top, 15)
    }
}
