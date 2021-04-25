//
//  CellForJobList.swift
//  GroupProject
//
//  Created by Kanghyun Kim
//  Student Number 991542281
//  Design for cell design.
//

import UIKit

class CellForJobList: UITableViewCell {
    
    let jobListTitleLable = UILabel()
    let jobListCoLabel = UILabel()
    let jobListLocLabel = UILabel()
    
    
    // Configure labels and add to screen
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        jobListTitleLable.textAlignment = .left
        jobListTitleLable.font = UIFont.boldSystemFont(ofSize: 24)
        jobListTitleLable.backgroundColor = .clear
        jobListTitleLable.textColor = .black
        
        jobListCoLabel.textAlignment = .left
        jobListCoLabel.font = UIFont.systemFont(ofSize: 16)
        jobListCoLabel.backgroundColor = .clear
        jobListCoLabel.textColor = .black
        
        jobListLocLabel.textAlignment = .left
        jobListLocLabel.font = UIFont.systemFont(ofSize: 16)
        jobListLocLabel.backgroundColor = .clear
        jobListLocLabel.textColor = .black
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(jobListTitleLable)
        contentView.addSubview(jobListCoLabel)
        contentView.addSubview(jobListLocLabel)
    }
    
    // Define x,y and width, height
    override func layoutSubviews() {
        jobListTitleLable.frame = CGRect(x: 30, y: 11, width: 460, height: 51)
        jobListCoLabel.frame = CGRect(x: 30, y: 53, width: 460, height: 22)
        jobListLocLabel.frame = CGRect(x: 30, y: 73, width: 460, height: 22)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
