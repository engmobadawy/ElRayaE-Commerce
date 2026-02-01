import SwiftUI

struct SearchWithFilterBar: View {
    @Binding var text: String
    var filterAction: () -> Void = {}

    var body: some View {
        HStack(spacing: 12) {
            searchField
            FilterButton(action: filterAction)
        }
       
    }
}

// MARK: - Search Field
private extension SearchWithFilterBar {
    var searchField: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.primary)

            TextField("Search", text: $text)
                .textInputAutocapitalization(.words)
                .autocorrectionDisabled()
        }
        .padding(.horizontal, 14)
        .frame(height: 54)
        .backgroundField()
    }
}

// MARK: - Filter Button
private struct FilterButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Label("Filter", systemImage: "slider.horizontal.3")
                .labelStyle(.iconOnly)
                .foregroundStyle(.primary)
                .frame(width: 48, height: 54)
                .backgroundField()
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Filter")
    }
}

#Preview {
    struct Demo: View {
        @State private var searchText = ""

        var body: some View {
            VStack {
                SearchWithFilterBar(text: $searchText) {
                    print("Filter tapped")
                }
                
                Spacer()
            }
            .padding(.top, 40)
        }
    }

    return Demo()
}
