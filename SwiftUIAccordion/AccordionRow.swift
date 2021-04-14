//
//  AccordionRow.swift
//  SwiftUIAccordion
//
//  Created by Nathan on 4/14/21.
//
import SwiftUI

struct AccordionRow: View {
  var content: AccordionRowRepresentable

    var body: some View {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text(content.title)
            .kerning(0.11)
            .font(.body)
            .foregroundColor(content.isEnabled ? Color.blue :
                              Color.gray)
            .disabled(!content.isEnabled)

          if let subtitle = content.subtitle {
            Text(subtitle)
              .kerning(0.11)
              .font(.caption)
              .foregroundColor(content.isEnabled ? Color.blue :
                                Color.gray)
              .disabled(!content.isEnabled)
          }
        }
        .padding()
        if content.isExternalLink {
            Image(systemName: "share")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
              .foregroundColor(content.isEnabled ? Color.blue :
                                Color.gray)
              .disabled(!content.isEnabled)
        }

        Spacer()
        if let tag = content.accessoryText {
          Text(tag)
            .font(.caption)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
            .background(Capsule().foregroundColor(content.isEnabled ? .blue : Color.blue.opacity(0.5)))
            .disabled(!content.isEnabled)
        }
      }
      .padding()
      .overlay(SwiftUI.Divider(), alignment: .bottom)
    }

  init(content: AccordionRowRepresentable) {
    self.content = content
  }
}

struct AccordionRow_Previews: PreviewProvider {
    static var previews: some View {
      AccordionRow(content: RowContentPreview(title: "Asthma", subtitle: "Jan 10, 2020", accessoryText: "Pending"))
    }
}
