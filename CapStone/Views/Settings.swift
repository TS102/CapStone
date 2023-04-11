//
//  Settings.swift
//  CapStone
//
//  Created by Tyler Sun on 3/31/23.
//

import SwiftUI

struct Settings: View {
    @State private var color1 = Color.white
    @State private var color2 = Color.red
    @State private var color3 = Color.blue
//
//    @Environment var colorState: ColorState
    
    
    var body: some View {
        VStack(spacing: 150) {
            ColorPicker("Select Top Color", selection: $color1)
            
            ColorPicker("Select Middle", selection: $color2)
            
            ColorPicker("Select Bottom", selection: $color3)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(  LinearGradient(gradient: Gradient(colors: [color1, color2, color3]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
   
    
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
