import SwiftUI

struct ProfileView: View {
    private let brandRed = Color(red: 176/255, green: 32/255, blue: 48/255)

    @State private var notificationsEnabled = true
    @State private var arabicEnabled = false

    var body: some View {
        NavigationStack {
            List {
                headerSection

                Section("Personal Information") {
                    navRow("Personal Information", icon: "person", route: .personalInfo)
                    navRow("Favorites", icon: "heart", route: .favorites)
                    navRow("Promo Code", icon: "ticket", route: .promo)
                    navRow("Shipping Address", icon: "box.truck", route: .shipping)
                    navRow("Wallet", icon: "creditcard", route: .wallet)
                }

                Section("Support & Information") {
                    navRow("About Us", icon: "flag", route: .about)
                    navRow("Privacy Policy", icon: "shield", route: .privacy)
                    navRow("Terms & Conditions", icon: "doc.text", route: .terms)
                    navRow("FAQs", icon: "questionmark.bubble", route: .faqs)
                }

                Section("Account Management") {
                    navRow("Change Password", icon: "lock", route: .changePassword)

                    Toggle(isOn: $notificationsEnabled) {
                        Label("Notifications", systemImage: "bell")
                    }
                    .tint(brandRed)

                    Toggle(isOn: $arabicEnabled) {
                        Label("Change To Arabic", systemImage: "globe")
                    }
                    .tint(brandRed)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("My Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(brandRed, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationDestination(for: Route.self) { route in
                destinationView(for: route)
            }
        }
    }

    // MARK: - Header (inside List)
    private var headerSection: some View {
        Section {
            HStack(spacing: 12) {
                Image(systemName: "person.crop.square.fill")
                    .font(.system(size: 34))
                    .frame(width: 60, height: 60)
                    .background(.white.opacity(0.15), in: RoundedRectangle(cornerRadius: 12))
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 2) {
                    Text("Ahmed Raza").font(.headline).foregroundStyle(.white)
                    Text("010387655454").font(.subheadline).foregroundStyle(.white.opacity(0.9))
                }

                Spacer()

                Button {
                    // logout / action
                } label: {
                    Image(systemName: "iphone.and.arrow.forward.outward")
                        .font(.system(size: 18, weight: .semibold))
                }
                .buttonStyle(.borderedProminent)
                .tint(.white.opacity(0.18))
                .foregroundStyle(.white)
                .accessibilityLabel("Account actions")
            }
            .padding(.vertical, 10)
            .listRowInsets(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
            .listRowBackground(brandRed)
        }
        
    }

    // MARK: - Helpers
    private func navRow(_ title: String, icon: String, route: Route) -> some View {
        NavigationLink(value: route) {
            Label(title, systemImage: icon)
        }
        .foregroundStyle(.primary)
    }

    private func destinationView(for route: Route) -> some View {
        // Replace with real screens later
        Text(route.title)
            .navigationTitle(route.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

enum Route: Hashable {
    case personalInfo, favorites, promo, shipping, wallet
    case about, privacy, terms, faqs
    case changePassword

    var title: String {
        switch self {
        case .personalInfo: "Personal Information"
        case .favorites: "Favorites"
        case .promo: "Promo Code"
        case .shipping: "Shipping Address"
        case .wallet: "Wallet"
        case .about: "About Us"
        case .privacy: "Privacy Policy"
        case .terms: "Terms & Conditions"
        case .faqs: "FAQs"
        case .changePassword: "Change Password"
        }
    }
}
