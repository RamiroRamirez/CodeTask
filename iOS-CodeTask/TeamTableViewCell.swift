import UIKit

class TeamTableViewCell: UITableViewCell {
    @IBOutlet private weak var teamColorView: UIView!

    @IBOutlet weak var crestView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var teamColor: UIColor? {
        didSet {
            teamColorView.backgroundColor = teamColor
        }
    }
}
