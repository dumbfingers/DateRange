//
//  DateRangeViewController.h
//  DateRange
//
//  Created by Yaxi Ye on 25/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateRangeViewController : UIViewController

@property (retain, nonatomic) UIButton *pickStart;
@property (retain, nonatomic) UIButton *pickEnd;
//@property (nonatomic, retain) UIButton *calcRange;
//@property (nonatomic, retain) UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) NSString *dateSelected;



- (IBAction)showDatePicker:(UIButton *)sender;
- (void)dueDateChanged:(UIDatePicker *)sender;
- (IBAction)doCalculation:(id)sender;
- (IBAction)setButtonTitleWithDate:(UIButton *)sender;

@end
