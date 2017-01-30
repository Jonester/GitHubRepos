//
//  Repo.m
//  GithubRepos
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithName:(NSString *)jsonName
{
    self = [super init];
    if (self) {
        _jsonName = jsonName;
    }
    return self;
}

@end
