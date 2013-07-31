//
//  ListItemsVC.h
//  ThriftSnap
//
//  Created by Deftsoft iMac on 24/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListItemsVC : UIViewController<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>

{


}

@property(nonatomic,retain)IBOutlet UITableView *m_TableView;
@property(nonatomic,retain)NSArray *m_ListItemArray;
@end
