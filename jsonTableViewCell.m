//
//  jsonTableViewCell.m
//  GithubRepos
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "jsonTableViewCell.h"
#import "Repo.h"

@implementation jsonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setRepo:(Repo *)repo {
    self.cellLabel.text = repo.jsonName;
}

@end
