//
//  DetailEditView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/6/23.
//

import SwiftUI

struct ExcursionEditView: View {
    @Binding var excursion: Excursion
    
    var body: some View {
        Form {
            Section(header: Text("Excursion Info")) {
                FloatingTextField(title: "Title", text: $excursion.title)

                FloatingDatePicker(title: "Date", date: $excursion.date)
            }

            VStack{
                Button(action: {
                    excursion.itinerary.insert(ItineraryItem.empty, at:0)
                    
                }){
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Itinerary Item")
                    }
                }
                .buttonStyle(.borderedProminent)
                Text("Swipe Right to Delete Itinerary Items.")
                    .foregroundColor(Color.red)
            }
            
            ForEach($excursion.itinerary) { item in
                Section(header: Text("Itinerary Item")) {
                    FloatingTextField(title: "Title", text: item.title)
                    FloatingTimePicker(title: "Time", date: item.date)
                    FloatingTextField(title: "Location Name", text: item.location.title)
                    FloatingTextField(title: "Address", text: item.location.address)
                    FloatingTextField(title: "Notes", text: item.notes, axis: .vertical)
                }
            }
            .onDelete{ indexSet in
                excursion.itinerary.remove(atOffsets: indexSet)
            }
        }//END FORM
    }
}

struct ExcursionEditView_Previews: PreviewProvider {
    static var previews: some View {
        ExcursionEditView(excursion: .constant(Excursion.sampleData[0]))
    }
}
