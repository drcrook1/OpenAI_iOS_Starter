//
//  ItineraryItemCardView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/6/23.
//

import SwiftUI

struct ItineraryItemCardView: View {
    let item: ItineraryItem
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Label(item.timeAsString, systemImage: "clock")
                Spacer()
                Text(item.title)
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
            }
        }
        .padding()
    }
}

struct ItineraryItemCardView_Previews: PreviewProvider {
    static var excursion = Excursion.sampleData[0]
    static var previews: some View {
        ItineraryItemCardView(item: excursion.itinerary[0])
            .previewLayout(.fixed(width: 400, height:60))
    }
}
