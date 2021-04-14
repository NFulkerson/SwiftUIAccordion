//
//  DataModel.swift
//  SwiftUIAccordion
//
//  Created by Nathan on 4/14/21.
//

import SwiftUI

struct AccordionMockData: AccordionRowRepresentable {
  var title: String
  var subtitle: String?
  var accessoryText: String?
  var isExternalLink: Bool = false
  var isEnabled: Bool = true
}

public class AccordionDataModel: ObservableObject {
  @Published var content: [AccordionContent] = []

  public func update(data: [AccordionContent]) {
    content = data
  }

  public static func mockData() -> [AccordionContent] {
    [
      AccordionContent(
        title: "Library",
        icon: Image(systemName: "gamecontroller.fill"),
        items: [
          AccordionMockData(title: "Pokemon Red", subtitle: "1996", accessoryText: "Complete"),
          AccordionMockData(title: "Pokemon Blue", subtitle: "1996")
        ],
        expanded: false
      ),

      AccordionContent(title: "Empty Container"),
      AccordionContent(
        title: "System",
        icon: Image(systemName: "pc"),
        items: [
          AccordionMockData(title: "Commodore 64"),
          AccordionMockData(title: "Amiga 1200"),
          AccordionMockData(title: "Apple II"),
          AccordionMockData(title: "IBM PC")
        ],
        expanded: false
      ),
      AccordionContent(title: "External Link", isExpandable: false, isExternalLink: true),
      AccordionContent(title: "Disabled Menu External Link", isExpandable: false, isEnabled: false, isExternalLink: true),
      AccordionContent(
        title: "Sub Menu",
        items: [
          AccordionMockData(title: "External Link", isExternalLink: true),
          AccordionMockData(title: "Disabled External Link", isExternalLink: true, isEnabled: false)
       ])
    ]
  }
}

public class AccordionContent {
  var title: String
  var icon: Image?
  var items: [AccordionRowRepresentable] = []
  var expanded: Bool = false
  var isExpandable = true
  var isEnabled = true
  var isExternalLink = false
  var senderId: String = "unknown"

  public init(title: String, icon: Image? = nil, items: [AccordionRowRepresentable] = [], expanded: Bool = false,
              isExpandable: Bool = true, isEnabled: Bool = true, isExternalLink: Bool = false, senderId: String = "unknown") {
    self.title = title
    self.icon = icon
    self.items = items
    self.expanded = expanded
    self.isExpandable = isExpandable
    self.isEnabled = isEnabled
    self.isExternalLink = isExternalLink
    self.senderId = senderId
  }
}
