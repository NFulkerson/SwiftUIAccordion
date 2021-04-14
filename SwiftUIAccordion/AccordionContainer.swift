//
//  AccordionContainer.swift
//  SwiftUIAccordion
//
//  Created by Nathan on 4/14/21.
//

import SwiftUI

public struct AccordionContainer: View {
  @State private var expanded: Bool = false
  var content: AccordionContent

  public var body: some View {
      VStack(alignment: .center, spacing: 0) {
        SwiftUI.Button(action: {
          expanded.toggle()
        }, label: {
          VStack {
            AccordionHeader(content: content, expanded: $expanded)
            SwiftUI.Divider()
              .foregroundColor(Color.gray)
          }
        })
        .buttonStyle(BorderlessButtonStyle())
        .animation(.easeIn)
        .disabled((content.items.isEmpty && content.isExpandable) || !content.isEnabled)

        if self.expanded {
          Group {
            ForEach(content.items, id: \.title) { item in
              AccordionRow(content: item)
                .onTapGesture {
                  debugPrint("Action fired")
                }
                .disabled(!item.isEnabled)
            }
            .transition(AnyTransition.opacity.combined(with: .move(edge: .top)))

            .animation(.easeIn)
          }
        }
      }

  }

  public init(content: AccordionContent) {
    self.content = content
  }
}

struct RowContentPreview: AccordionRowRepresentable {
  var title: String
  var subtitle: String?
  var accessoryText: String?
  var isEnabled = true
  var isExternalLink = false
  var senderId = "unknown"
}

struct AccordionContainer_Previews: PreviewProvider {
    static var previews: some View {
      AccordionContainer(content: AccordionContent(
        title: "Content",
        icon: Image(systemName: "questionmark.folder"),
        items: [
          RowContentPreview(title: "Projects", subtitle: "Sprint 1", accessoryText: "Planning")
        ]
      ))
    }
}
