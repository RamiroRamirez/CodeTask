import Foundation

// Mocks an actual networking class to simplify example.
class MockTeamLoader {
    func loadTeams(completionBlock: (([Team]) -> Void)) {
        let playerA1 = player(firstName: "Raul", lastName: "Gudiño", id: "181")
        let playerA2 = player(firstName: "Hiram", lastName: "Mier", id: "180")
        let playerA3 = player(firstName: "Jorge", lastName: "Sánchez", id: "1992")
        let playerA4 = player(firstName: "José", lastName: "Macías", id: "50793")
        let playerA5 = player(firstName: "Manuel", lastName: "García", id: "1264")

        let teamAPlayers = [
            playerA1, playerA2, playerA3, playerA4, playerA5
        ]

        let teamA = Team(name: "Team A", players: teamAPlayers, crestURL: URL(string: "https://www.logolynx.com/images/logolynx/a5/a53f65f7104ae9828a2d4bcd08762689.png")!, color: .blue)

        let playerB1 = player(firstName: "Daneil", lastName: "Sánchez", id: "181")
        let playerB2 = player(firstName: "Rogelio", lastName: "Lara", id: "180")
        let playerB3 = player(firstName: "Guillermo", lastName: "Ochoa", id: "1992")
        let playerB4 = player(firstName: "Ricardo", lastName: "Loris", id: "50793")
        let playerB5 = player(firstName: "Javier", lastName: "López", id: "1264")

        let teamBPlayers = [
            playerB1, playerB2, playerB3, playerB4, playerB5
        ]

        let teamB = Team(name: "Team B", players: teamBPlayers, crestURL: URL(string: "https://pbs.twimg.com/profile_images/3375159049/2a830fb5978a26385cfb8d2c5557da7e_400x400.jpeg")!, color: .yellow)

        completionBlock([teamA, teamB])
    }

    private func player(firstName: String, lastName: String, id: String) -> Player {
        return Player(firstName: firstName, lastName: lastName, pictureURL: URL(string: "https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png")!)
    }
}
