//
//  AccordionHeader.swift
//  SwiftUIAccordion
//
//  Created by Nathan on 4/14/21.
//

import SwiftUI

public struct AccordionHeader: View {
  var content: AccordionContent
  @Binding var expanded: Bool
  @Environment(\.isEnabled) var isEnabled
  public var body: some View {
    HStack {
      if let icon = content.icon {
        icon
          .foregroundColor(
            isEnabled ? Color.blue : Color.gray
          )
      }

      Text(content.title)
        .foregroundColor(isEnabled ? Color.blue : Color.gray)

      if content.isExternalLink {
            Image(systemName: "share")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
              .foregroundColor(isEnabled ? Color.blue : Color.gray)
        }
      Spacer()
      if content.isExpandable {
      Image(systemName: expanded ? "chevron.up" : "chevron.down")
        .foregroundColor(isEnabled ? Color.blue : Color.gray)
        }
    }
    .padding()
  }

}

struct AccordionHeader_Previews: PreviewProvider {
    static var previews: some View {
      AccordionHeader(content: AccordionContent(
          title: "Vitals",
          icon: Image(systemName: "gamecontroller.fill")),
          expanded: .constant(true))
    }
}
