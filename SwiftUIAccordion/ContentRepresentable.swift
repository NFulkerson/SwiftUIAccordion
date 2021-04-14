//
//  ContentRepresentable.swift
//  SwiftUIAccordion
//
//  Created by Nathan on 4/14/21.
//

import SwiftUI

public protocol ListRepresentable {
  var title: String? { get }
  var subtitle: String? { get }
  var tertiaryTitle: String? { get }
  var image: Image? { get }
}

public protocol AccordionRowRepresentable {
  var title: String { get }
  var subtitle: String? { get }
  var accessoryText: String? { get }
  var isExternalLink: Bool { get }
  var isEnabled: Bool { get }
}
