//
//  EventForm.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/22/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI

struct EventForm: View {
    
    @Binding var eventFormPresented: Bool
    @State var content: String = ""
    
    var mainBkg: Color = Color("mainBkg")
    
    var body: some View {
        // CHANGE NAVIGATION BAR TITLE WHEN IOS 14 COMES OUT
        NavigationView{
            VStack{
                HStack{
                    Text("New Event")
                        .font(.headline)
                        .offset(x: 37)
                    .frame(maxWidth: .infinity, alignment: .center)
                    Button(action: {
                        self.eventFormPresented.toggle()
                    }){
                        Text("Submit")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    .frame(alignment: .trailing)
                }
                .padding()

                MultilineTextField(text: $content, placeholder: "Enter a description...")
                    .frame(height: 70)
                .padding(.horizontal)
                .padding([.top, .bottom], 5)
                
                Divider()
                    .padding(.horizontal)
                
                HStack{
                    Text("Include Your Friends")
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal)
                .padding([.top, .bottom], 5)
                
                Divider()
                .padding(.horizontal)
                
                
                HStack{
                    NavigationLink(destination: LocationPickerView()){
                        Text("Add Location")
                        
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal)
                .padding([.top, .bottom], 5)
                
                Divider()
                .padding(.horizontal)
                
                Spacer()
             
                Text("Slide down to dismiss")
                .foregroundColor(.gray)
                .padding()
            }
            .navigationBarTitle("New Event", displayMode: .inline)
        }
        .background(mainBkg)
        
        
        
    }
}

//struct EventForm_Previews: PreviewProvider {
//    static var previews: some View {
//        EventForm(eventFormPresented: .constant(true)).previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
//            .environment(\.colorScheme, .dark)
//    }
//}
