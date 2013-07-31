//
//  MorePhotoVC.h
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MorePhotoVC : UIViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

-(IBAction)camBtnPressed:(id)sender;

-(IBAction)doneBarBtnPressed:(id)sender;
@end
