//
//  ExcursionCreateView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/7/23.
//

import SwiftUI

struct ExcursionCreateView: View {
    @Binding var excursion: Excursion
    
    var body: some View {
        Form {
            Section(header: Text("Excursion Info")) {
                FloatingTextField(title: "Title", text: $excursion.title)
                FloatingDatePicker(title: "Date", date: $excursion.date)
            }

            ForEach($excursion.itinerary) { item in
                Section(header:Text("ItineraryItem")) {
                    FloatingTextField(title: "Title", text: item.title)
                    FloatingTimePicker(title: "Time", date: item.date)
                    FloatingTextField(title: "Location Name", text: item.location.title)
                    FloatingTextField(title: "Address", text: item.location.address)
                    FloatingTextField(title: "Notes", text: item.notes, axis: .vertical)
                }
            }
        } //END FORM
    }
}

struct ExcursionCreateView_Previews: PreviewProvider {
    static var previews: some View {
        ExcursionEditView(excursion: .constant(Excursion.sampleData[0]))
    }
}
