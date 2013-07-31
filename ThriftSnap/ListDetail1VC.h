//
//  ListDetail1VC.h
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListDetail1VC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)IBOutlet UITableView *grpTableView;
@property(nonatomic,retain)NSString *tableTitle;
-(IBAction)doneBarBtnPressed:(id)sender;
@end
