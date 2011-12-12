//
//  MasterViewController.h
//  NavigationControllerDemo
//
//  Created by Evgeny Mikerin on 11.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UIViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
