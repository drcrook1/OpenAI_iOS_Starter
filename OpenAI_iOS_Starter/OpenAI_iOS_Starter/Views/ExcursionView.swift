//
//  DetailView.swift
//  OpenAI_iOS_Starter
//
//  Created by David Crook on 6/5/23.
//

import SwiftUI

struct ExcursionView: View {
    @Binding var excursion: Excursion
    
    @State private var isPresentingEditView = false
    @State private var editingExcursion = Excursion.empty
    
    var body: some View {
        VStack {
            Section(header: Text("\(excursion.title)").font(.headline).bold()) {
                Label("\(excursion.dateAsString)", systemImage: "calendar")
            }
            
                NavigationStack{
                    List($excursion.itinerary) { $item in
                        NavigationLink(destination: ItineraryItemView(item: $item)){
                            ItineraryItemCardView(item: item)
                        }
                    }
                }

        }
        .toolbar {
            ZStack {
                Button("Edit") {
                    isPresentingEditView = true
                    editingExcursion = excursion
                }
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                ExcursionEditView(excursion: $editingExcursion)
                    .navigationTitle(excursion.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                excursion = editingExcursion
                            }
                        }
                    }
            }
        }
    }
}

struct ExcursionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExcursionView(excursion: .constant(Excursion.sampleData[0]))
        }
    }
}
