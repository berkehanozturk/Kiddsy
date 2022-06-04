//
//  itemModal.swift
//  Service
//
//  Created by Berkehan on 17.02.2022.
//

import Foundation
import UIKit
public struct ItemModal: Decodable {
    public var description: String
    public var endTime: CGFloat
    public var imageUrl: String
    public var startTime: CGFloat
    public var videoUrl: String
    public var duration: CGFloat

}

