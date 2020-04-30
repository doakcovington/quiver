doak = User.create(name: "Doak", email: "DoakCovington@icloud.com", password: "123")

heidi = User.create(name: "Heidi", email: "Heidi.M.Covington@gmail.com", password: "abc")

Ski.create(name: "Mantra", brand: "Volkl", category: "All Mountain", user_id: doak.id)

doak.skis.create(name: "RTM", brand: "Volkl", category: " All Mountain")

heidis_ski = heidi.skis.build(name: "Santa Anna", brand: "Nordica", category: "All Mountain")

heidis_ski.save