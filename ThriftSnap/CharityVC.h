//
//  CharityVC.h
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharityVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)IBOutlet UITableView* charityTableView;

-(IBAction)doneBarBtnPressed:(id)sender;          
@end
