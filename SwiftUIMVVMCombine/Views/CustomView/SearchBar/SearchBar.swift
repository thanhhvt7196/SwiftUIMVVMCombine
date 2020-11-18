//
//  SearchBar.swift
//  SwiftUIMVVMCombine
//
//  Created by thanh tien on 11/16/20.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var placeHolder: String
    private let padding: CGFloat = 10
        
    var body: some View {
        GeometryReader { geometry in
            makeView(geometry)
        }
        
    }
    
    private func makeView(_ geometry: GeometryProxy) -> some View {
        HStack(alignment: .center) {
            Spacer(minLength: padding)
            
            TextField(placeHolder, text: $text)
                .frame(height: geometry.size.height - padding * 2)
                .padding(.horizontal, 30)
                .background(Color(.systemGray5))
                .cornerRadius( (geometry.size.height - padding * 2)/2)
                .overlay(
                    HStack {
                        Image(uiImage: Asset.searchNormal.image)
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(padding)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, padding)
                            }
                        }
                    }
                )
                .onTapGesture {
                    self.isEditing = true
                }
                .animation(.easeInOut)
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text(Strings.cancel)
                }
                .frame(height: geometry.size.height - padding * 2)
                .transition(.move(edge: .trailing))
                .animation(.easeInOut)
            }
            
            Spacer(minLength: padding)
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        .clipped()
    }
}
