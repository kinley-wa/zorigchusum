import Foundation

struct Craft: Identifiable {
    let id = UUID()
    let name: String            // Dzongkha term
    let englishName: String     // English meaning
    let imageName: String       // Asset name (or SF Symbol fallback)
    let description: String
}

extension Craft {
    static let allCrafts: [Craft] = [
        Craft(name: "Shingzo", englishName: "Carpentry", imageName: "shingzo",
              description: "The art of woodworking used to construct Bhutan's iconic wooden houses, temples, and dzongs, traditionally built without nails using precise interlocking joints."),
        Craft(name: "Dozo", englishName: "Masonry", imageName: "dozo",
              description: "The craft of stonework and rammed-earth construction, used for building walls, chortens (stupas), and the massive foundations of dzongs and monasteries."),
        Craft(name: "Parzo", englishName: "Carving", imageName: "parzo",
              description: "Intricate carving in wood, slate, and stone, seen in altars, furniture, window frames, and religious motifs decorating temples and homes."),
        Craft(name: "Lhazo", englishName: "Painting", imageName: "lhazo",
              description: "Traditional Bhutanese painting of religious and decorative motifs on walls, thangkas (scroll paintings), furniture, and building facades."),
        Craft(name: "Jinzo", englishName: "Sculpting", imageName: "jinzo",
              description: "The art of sculpting clay statues of Buddhist deities, often finished with paint and gold, found in temples and monasteries across the country."),
        Craft(name: "Lugzo", englishName: "Bronze-casting", imageName: "lugzo",
              description: "Casting of bronze and metal statues, ritual objects, and bells using traditional lost-wax casting techniques passed down through generations."),
        Craft(name: "Garzo", englishName: "Blacksmithing", imageName: "garzo",
              description: "The forging of iron tools, knives, and implements — historically including the famous iron chain bridges built by the saint Thangtong Gyalpo."),
        Craft(name: "Troeko", englishName: "Ornament-making", imageName: "troeko",
              description: "Crafting of gold and silver jewelry and ornaments, including intricate pieces worn during festivals and ceremonial occasions."),
        Craft(name: "Tsharzo", englishName: "Cane and bamboo work", imageName: "tsharzo",
              description: "Weaving of bamboo and cane into baskets, mats, hats, and the iconic bangchung (woven containers) used in daily Bhutanese life."),
        Craft(name: "Thagzo", englishName: "Weaving", imageName: "thagzo",
              description: "The renowned art of hand-weaving textiles, producing intricate patterns on traditional looms — considered one of the most refined Bhutanese crafts."),
        Craft(name: "Tshemzo", englishName: "Tailoring, embroidery & appliqué", imageName: "tshemzo",
              description: "The needlework arts of tailoring national dress, embroidery, and appliqué, including the large religious thangkas displayed during festivals."),
        Craft(name: "Shagzo", englishName: "Woodturning", imageName: "shagzo",
              description: "The turning of wood on a lathe to create bowls, cups, and containers, notably the fine lacquered wooden bowls called dapa."),
        Craft(name: "Deh-sho", englishName: "Paper-making", imageName: "deh-sho",
              description: "Traditional hand-making of paper (desho) from the bark of the daphne plant, used for scriptures, documents, and crafts.")
    ]
}
