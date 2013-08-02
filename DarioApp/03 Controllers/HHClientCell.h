//
//  HHClientCell.h
//  DarioApp
//
//  Created by Horacio Herrera on 7/19/13.
//  Copyright (c) 2013 Horacio Herrera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHClientCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@end
