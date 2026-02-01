import SwiftUI



struct CategoryCard: View {
    let category: Category
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: category.systemImage)
                .font(.system(size: 38, weight: .regular))
                .foregroundStyle(.red)

            Text(category.title)
                .font(.system(size: 12))
                .lineSpacing(4)
                .multilineTextAlignment(.center)
                .frame(width: 84, height: 40, alignment: .center)

        }
        .frame(width: 85, height: 98)
        .background(Color("BG1"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? .purple : .clear, lineWidth: 2)
        }
        .contentShape(RoundedRectangle(cornerRadius: 16))
        .animation(.easeInOut(duration: 0.18), value: isSelected)
    }
}









#Preview("Category Card – States") {
    HStack(spacing: 12) {
        CategoryCard(
            category: .handlesKnobs,
            isSelected: true
        )

        CategoryCard(
            category: .locksSecurity,
            isSelected: false
        )
        
        CategoryCard(
            category: .locksSecurity,
            isSelected: false
        )
        
        CategoryCard(
            category: .locksSecurity,
            isSelected: false
        )
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}


    
