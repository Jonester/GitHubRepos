//
//  ViewController.m
//  GithubRepos
//
//  Created by Chris Jones on 2017-01-30.
//  Copyright © 2017 Jonescr. All rights reserved.
//

#import "ViewController.h"
#import "jsonTableViewCell.h"
#import "Repo.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *jsonTableView;
@property (strong, nonatomic) NSString *repoName;
@property (strong, nonatomic) NSMutableArray *jsons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.jsons = [NSMutableArray new];

    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/Jonester/repos"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        NSError *jsonError = nil;
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"JSON error: %@", jsonError.localizedDescription);
            return;
        }
        for (NSDictionary *repo in repos) {
            Repo *eachRepo = [[Repo alloc]initWithName:[repo valueForKey:@"name"]];
            NSLog(@"Repo: %@", self.repoName);
            [self.jsons addObject:eachRepo];
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.jsonTableView reloadData];
        }];
    }];

 
    
    
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.jsons.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    jsonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Repo *repo = self.jsons[indexPath.row];
    [cell setRepo:repo];
    return cell;
}

@end
