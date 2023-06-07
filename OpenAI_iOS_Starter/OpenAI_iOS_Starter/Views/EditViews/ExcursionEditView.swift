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
                TextField("Title", text: $excursion.title)
                DatePicker("Date", selection: $excursion.date, displayedComponents: [.date])
            }
            
            Text("Itinerary")

            ForEach($excursion.itinerary) { $item in
                Section() {
                    VStack{
                        TextField("Title", text: $item.title)
                        TextField("Location Name", text: $item.location.title)
                        TextField("Address", text: $item.location.address)
                    }
                }
            }

            
        } //END FORM
    }
}

struct ExcursionEditView_Previews: PreviewProvider {
    static var previews: some View {
        ExcursionEditView(excursion: .constant(Excursion.sampleData[0]))
    }
}
