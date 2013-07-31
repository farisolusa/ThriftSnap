//
//  DeliveryVC.h
//  ThriftSnap
//
//  Created by iMac on 30/07/13.
//  Copyright (c) 2013 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeliveryVC : UIViewController

@property(nonatomic,retain)IBOutlet UIView *inPersonView;
@property(nonatomic,retain)IBOutlet UIView *USPSView;

@property(nonatomic,retain)IBOutlet UIView *packageTypeView;

- (IBAction)packageBtnPressed:(id)sender;


@end
