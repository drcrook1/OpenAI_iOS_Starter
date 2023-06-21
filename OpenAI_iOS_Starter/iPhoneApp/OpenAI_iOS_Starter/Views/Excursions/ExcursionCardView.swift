//
//  CardView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/2/23.
//

import SwiftUI

struct ExcursionCardView: View {
    let excursion: Excursion
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(excursion.dateAsString)
                Spacer()
                Text(excursion.title)
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
            }
        }
        .padding()
    }
}

struct ExcursionCardView_Previews: PreviewProvider {
    static var excursion = Excursion.sampleData[0]
    static var previews: some View {
        ExcursionCardView(excursion: excursion)
            .previewLayout(.fixed(width: 400, height:60))
    }
}
