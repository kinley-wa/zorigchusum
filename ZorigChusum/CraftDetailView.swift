import SwiftUI

struct CraftDetailView: View {
    let craft: Craft
    @State private var isVisited = false
    @State private var appeared = false

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Image card — scales with screen size, never crops
                    ZStack {
                        RoundedRectangle(cornerRadius: 28, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [Color.bhutanMaroon, Color.bhutanMaroon.opacity(0.85)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )

                        RoundedRectangle(cornerRadius: 28, style: .continuous)
                            .stroke(Color.bhutanSaffron.opacity(0.8), lineWidth: 2)
                            .padding(8)

                        Group {
                            if UIImage(named: craft.imageName) != nil {
                                Image(craft.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                Image(systemName: "paintbrush.pointed.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(Color.bhutanSaffron)
                                    .padding(50)
                            }
                        }
                        .padding(28)
                    }
                    .frame(height: min(max(geo.size.height * 0.3, 200), 300))
                    .padding(.horizontal)
                    .padding(.top, 12)
                    .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 6)

                    VStack(alignment: .leading, spacing: 6) {
                        Text(craft.name)
                            .font(.system(.largeTitle, design: .serif))
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                            .minimumScaleFactor(0.8)

                        Text(craft.englishName)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 12) {
                        HStack(spacing: 6) {
                            Image(systemName: "quote.opening")
                                .foregroundStyle(Color.bhutanSaffron)
                            Text("About this craft")
                                .font(.system(.headline, design: .serif))
                                .foregroundStyle(.primary)
                        }

                        Divider()

                        Text(craft.description)
                            .font(.body)
                            .lineSpacing(5)
                            .foregroundStyle(.primary)
                    }
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color.bhutanCard)
                    )
                    .padding(.horizontal)

                    Button {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.7)) {
                            isVisited.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: isVisited ? "checkmark.seal.fill" : "seal")
                            Text(isVisited ? "Learned About This Craft" : "Mark as Learned")
                        }
                        .font(.system(.headline, design: .serif))
                        .foregroundStyle(isVisited ? .white : Color.bhutanMaroon)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(isVisited ? Color.bhutanForest : Color.bhutanSaffron.opacity(0.2))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke(isVisited ? Color.bhutanForest : Color.bhutanMaroon, lineWidth: 1.5)
                        )
                    }
                    .buttonStyle(.plain)
                    .scaleEffect(isVisited ? 1.0 : 1.0)
                    .padding(.horizontal)

                    Spacer(minLength: 24)
                }
                .opacity(appeared ? 1 : 0)
                .offset(y: appeared ? 0 : 8)
            }
        }
        .background(Color.bhutanBackground.ignoresSafeArea())
        .navigationTitle(craft.englishName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                appeared = true
            }
        }
    }
}

#Preview {
    NavigationStack {
        CraftDetailView(craft: Craft.allCrafts[9])
    }
}
