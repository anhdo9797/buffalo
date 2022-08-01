//
//  IICon.swift
//  Training
//
//  Created by phuocanh on 21/07/2022.
//

import SwiftUI

struct IICon: View {
    let name: String;
    let size: Double;

    var body: some View {
        Image(systemName: name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size, alignment: .center)
         
    }
}

struct IICon_Previews: PreviewProvider {
    static var previews: some View {
        IICon(name: "person.circle", size: 40)
    }
}
