import SwiftUI

extension Color {
    /// Primary brand color — deep maroon, slightly lifted in Dark Mode for contrast
    static let bhutanMaroon = Color(uiColor: UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.62, green: 0.20, blue: 0.20, alpha: 1.0)
            : UIColor(red: 0.42, green: 0.09, blue: 0.09, alpha: 1.0)
    })

    /// Accent color — saffron/gold
    static let bhutanSaffron = Color(uiColor: UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.96, green: 0.72, blue: 0.30, alpha: 1.0)
            : UIColor(red: 0.90, green: 0.60, blue: 0.13, alpha: 1.0)
    })

    /// Success / positive state
    static let bhutanForest = Color(uiColor: UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(red: 0.32, green: 0.58, blue: 0.38, alpha: 1.0)
            : UIColor(red: 0.15, green: 0.35, blue: 0.22, alpha: 1.0)
    })

    /// Screen background — native system color, adapts automatically
    static let bhutanBackground = Color(uiColor: .systemGroupedBackground)

    /// Card / row surface — native system color, adapts automatically
    static let bhutanCard = Color(uiColor: .secondarySystemGroupedBackground)
}
