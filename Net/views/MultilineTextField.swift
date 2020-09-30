//
//  MultiLineTextField.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 9/5/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI

struct MultilineTextField: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String

    func makeCoordinator() -> Coordinator {
        return MultilineTextField.Coordinator(parent1: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.font = UIFont.preferredFont(forTextStyle: .body)
        view.backgroundColor = UIColor.clear
        view.text = placeholder
        view.textColor = .gray
        view.delegate = context.coordinator
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate{
        
        var parent: MultilineTextField
        
        init(parent1: MultilineTextField){
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text.isEmpty || textView.text == parent.placeholder{
                textView.text = ""
                textView.textColor = .label
            }
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = parent.placeholder
                textView.textColor = .gray
            }
        }
        
    }
}
