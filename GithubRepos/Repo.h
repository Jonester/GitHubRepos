//
//  Repo.h
//  GithubRepos
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repo : NSObject

@property (strong, nonatomic) NSString *jsonName;

- (instancetype)initWithName:(NSString *)jsonName;

@end
