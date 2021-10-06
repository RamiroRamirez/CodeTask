import UIKit
import CloudKit
import CallKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var tableView: UITableView?

    var data = [Any]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame:self.view.frame)
        tableView!.delegate = self
        tableView!.dataSource = self
        self.tableView!.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView!.register(UINib(nibName: "TeamTableViewCell", bundle: nil), forCellReuseIdentifier: "TeamCell")
        tableView!.rowHeight = 60
        view?.addSubview(tableView!)
        loadData()

    }

     func loadData() {
        MockTeamLoader().loadTeams { (teams) in
            var newData = [Any]()

            for team in teams {
                newData.append(team)
                newData.append(contentsOf: team.players)
            }

            data = newData
            self.tableView?.reloadData()
        }
    }


    func downloadImage(url: URL, completion: @escaping ((UIImage) -> (Void))) {
        let downloadTask = URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            let img = UIImage(data: data!)
            completion(img!)
        }
        downloadTask.resume()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = data[indexPath.row]

        if rowData is Team {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath as IndexPath) as! TeamTableViewCell
            cell.nameLabel.text = (rowData as! Team).name
            cell.teamColor = (rowData as! Team).color

            downloadImage(url: (rowData as! Team).crestURL) { (image) -> (Void) in
                cell.crestView.image = image
            }
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell") as! PlayerTableViewCell
            cell.firstnameLabel.text = (rowData as! Player).firstName
            cell.lastnameLabel.text = (rowData as! Player).lastName

            downloadImage(url: (rowData as! Player).pictureURL) { (image) -> (Void) in
                cell.pictureView.image = image
            }

            return cell
        }
    }




}

