//
//  RoundedShape.swift
//  Fitness
//
//  Created by Asil Arslan on 23.08.2021.
//

import SwiftUI

struct RoundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 5, height: 5))
        
        return Path(path.cgPath)
    }
}
