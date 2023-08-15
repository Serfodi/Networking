//
//  CursesViewController.swift
//  GetAndPostRequests
//
//  Created by Сергей Насыбуллин on 05.08.2023.
//

import UIKit

class CursesViewController: UITableViewController {
    
    private var courses = [Course]()
    private var courseName: String?
    private var courseURL: String?
    private let url = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    
    func fetchData() {
        NetworkManager.fetchData(url: url) { courses in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData() 
            }
        }
    }

    
    private func configureCell(cell: TableViewCell, for indexPatch: IndexPath) {
        
        let course = courses[indexPatch.row]
        
        cell.courseNameLabel.text = course.name
        
        if let courseNumberOfLessons = course.numberOfLessons {
            cell.numberOfLessons.text = "Number of lessons: \(courseNumberOfLessons)"
        }
        if let courseNumberOfTests = course.numberOfTests {
            cell.numberOfTests.text = "Number of test: \(courseNumberOfTests)"
        }
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: course.imageUrl!) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                cell.courseImageVeiw.image = UIImage(data: imageData)
            }
        }
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        let webViewControoler = segue.destination as! WebViewController
        
        if let url = courseURL {
            webViewControoler.courseUrl = url
        }
        
    }
    

}

extension CursesViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        configureCell(cell: cell, for: indexPath)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        courseURL = course.link
        courseName = course.name
        
        performSegue(withIdentifier: "Description", sender: self)
    }
    
}


