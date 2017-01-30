//
//  jsonTableViewCell.h
//  GithubRepos
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Repo;

@interface jsonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (strong, nonatomic) Repo* repo;

@end
