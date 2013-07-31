//
//  ListDetail2VC.h
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListDetail2VC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)NSMutableArray *tableArray;
@property(nonatomic,retain)UITableViewCell *cell;
@property(nonatomic,retain)IBOutlet UITableView *listTableView;
@property(nonatomic,retain)NSMutableString *selectedRow;


-(IBAction)doneBarBtnPressed:(id)sender;
@end
