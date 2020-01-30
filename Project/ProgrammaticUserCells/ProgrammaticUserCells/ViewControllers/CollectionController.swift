import UIKit
// Primary View. Displays random user data in a collection view.
class CollectionController: UIViewController {
    // MARK: Properties
    var collection = ViewControllerView()
    var users = [User]() {
        didSet{
            DispatchQueue.main.async{
                self.collection.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = collection
    }
    // MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.collectionView.dataSource = self
        collection.collectionView.delegate = self
        collection.collectionView.register(UINib(nibName: "RandomPersonCell", bundle: nil), forCellWithReuseIdentifier: "randomUserCell")
        navigationItem.title = "Random Fake People"
        loadUsers()
    }
    // MARK: Helper methods
    private func loadUsers(){
        UsersFetchingService.manager.getUsers { [weak self] result in
            switch result{
            case .failure(let appError):
                print("Encountered Error loading users: \(appError)")
            case .success(let people):
                self?.users = people
            }
        }
    }
    
}
// MARK: Collection View DataSource Methods
extension CollectionController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let xCell =  collection.collectionView.dequeueReusableCell(withReuseIdentifier: "randomUserCell", for: indexPath) as? RandomPersonCell else {
            fatalError("Could not dequeue cell as a RandomPersonCell")
        }
        xCell.setUp(users[indexPath.row])
        xCell.backgroundColor = .systemPink
        xCell.layer.borderColor = UIColor.black.cgColor
        xCell.layer.borderWidth = 1.0
        return xCell
    }
}

// MARK: Collection View Delegate Methods
extension CollectionController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width * 0.7, height: UIScreen.main.bounds.size.height * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedVC = DetailedViewController()
        detailedVC.currentPerson = users[indexPath.row]
        navigationController?.pushViewController(detailedVC, animated: true)
    }
}

