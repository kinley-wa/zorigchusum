import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    var filteredCrafts: [Craft] {
        if searchText.isEmpty {
            return Craft.allCrafts
        } else {
            return Craft.allCrafts.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.englishName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if filteredCrafts.isEmpty {
                    emptyState
                } else {
                    List {
                        ForEach(filteredCrafts) { craft in
                            NavigationLink(destination: CraftDetailView(craft: craft)) {
                                CraftRow(craft: craft)
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                        }
                    }
                    .listStyle(.plain)
                    .animation(.easeInOut(duration: 0.2), value: searchText)
                }
            }
            .background(Color.bhutanBackground.ignoresSafeArea())
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 2) {
                        HStack(spacing: 6) {
                            Image(systemName: "mountain.2.fill")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(Color.bhutanSaffron)
                            Text("Zorig Chusum")
                                .font(.system(.headline, design: .serif))
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                        }
                        Text("The Thirteen Traditional Arts")
                            .font(.system(size: 10, weight: .medium, design: .serif))
                            .foregroundStyle(Color.bhutanSaffron.opacity(0.9))
                            .tracking(0.4)
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search the 13 arts")
            .toolbarBackground(Color.bhutanMaroon, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .tint(.bhutanMaroon)
    }

    private var emptyState: some View {
        VStack(spacing: 14) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 40, weight: .light))
                .foregroundStyle(.secondary)
            Text("No crafts found")
                .font(.system(.headline, design: .serif))
                .foregroundStyle(.primary)
            Text("Try a different name, like \"Thagzo\" or \"Painting\".")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bhutanBackground)
    }
}

/// A single row, extracted for clarity and reuse.
private struct CraftRow: View {
    let craft: Craft

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(Color.bhutanMaroon)
                    .frame(width: 46, height: 46)
                Text(String(craft.name.prefix(1)))
                    .font(.system(.title3, design: .serif))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.bhutanSaffron)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(craft.name)
                    .font(.system(.headline, design: .serif))
                    .foregroundStyle(.primary)
                Text(craft.englishName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 0)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.bhutanCard)
                .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
        )
    }
}

#Preview {
    ContentView()
}
