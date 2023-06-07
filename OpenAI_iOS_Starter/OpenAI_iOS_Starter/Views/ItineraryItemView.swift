//
//  ItineraryItemView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/6/23.
//

import SwiftUI

struct ItineraryItemView: View {
    @Binding var item: ItineraryItem
    var body: some View {
        VStack{
            Text("\(item.title)").bold()
            Text("\(item.location.title)")
            Text("\(item.location.address)")
            HStack{
                Text("\(item.dateAsString)")
                Text("\(item.timeAsString)")
            }
            Text("\(item.notes)").padding(14)
        }
    }
}

struct ItineraryItemView_Previews: PreviewProvider {
    static var previews: some View {
        let excursion = Excursion.sampleData[0]
        ItineraryItemView(item: .constant(excursion.itinerary[0]))
    }
}
