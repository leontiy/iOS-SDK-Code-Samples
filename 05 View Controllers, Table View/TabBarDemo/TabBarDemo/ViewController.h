//
//  ViewController.h
//  TabBarDemo
//
//  Created by Evgeny Mikerin on 11.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITabBarDelegate>
@property (retain, nonatomic) IBOutlet UILabel *tabLabel;

@end
