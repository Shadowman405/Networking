import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private var courses = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }
    
    func fetchData() {
        let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
        //let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
        
        
        guard let url = URL(string: jsonUrlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                self.courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func configureCell(cell: TableViewCell, for indexPath: IndexPath) {
        let course = courses[indexPath.row]
        cell.courseNameLabel.text = course.name
        
        if let numberOfLessons = course.number_of_lessons {
            cell.numberOfLessons.text = "Number of lessons: \(numberOfLessons)"
        }
        
        if let numberOfTest = course.number_of_tests {
            cell.numberOfTests.text = "Number of test: \(numberOfTest)"
        }
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: course.imageUrl!) else { return  }
            guard let imageData = try? Data(contentsOf: imageUrl) else {return}
            
            DispatchQueue.main.async {
                cell.courseImage.image = UIImage(data: imageData)
            }
        }
    }

}

// MARK: Table View Data Source

extension CoursesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        configureCell(cell: cell, for: indexPath)
        return cell
    }
}

// MARK: Table View Delegate

extension CoursesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

