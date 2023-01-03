//
//  TableViewCell.swift
//  CoreDataAssignment5thTry
//
//  Created by Consultant on 1/2/23.
//

import UIKit

class myCustomLabel : UILabel
{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init()
    {
        super.init(frame: .zero)
        font = UIFont.preferredFont(forTextStyle: .body)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // This will call `awakeFromNib` in your code
        fatalError("Should never be called")
    }
}

class TableViewCell: UITableViewCell
{
    let idLabel = myCustomLabel()
    let userIdLabel = myCustomLabel()
    let titleLabel = myCustomLabel()
    let completedLabel = myCustomLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemOrange
        contentView.addSubview(idLabel)
        contentView.addSubview(userIdLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(completedLabel)
        
        configureIdLabel()
        configureUserIdLabel()
        configureTitleLabel()
        configureCompletedLabel()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        fatalError("Should never be called 2")
    }
    
    func configureIdLabel()
    {
        idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        idLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        idLabel.heightAnchor.constraint(equalToConstant: contentView.frame.height / 4).isActive = true
        idLabel.text = "ID"
    }
    
    func configureUserIdLabel()
    {
        userIdLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 5).isActive = true
        userIdLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        userIdLabel.heightAnchor.constraint(equalToConstant: contentView.frame.height / 4).isActive = true
        userIdLabel.text = "userID"
    }
    
    func configureTitleLabel()
    {
        titleLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 5).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: contentView.bounds.height / 4).isActive = true
        titleLabel.text = "title"
    }
    
    func configureCompletedLabel()
    {
        completedLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        completedLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        completedLabel.heightAnchor.constraint(equalToConstant: contentView.frame.height / 4).isActive = true
        completedLabel.text = "completed"
    }

}
