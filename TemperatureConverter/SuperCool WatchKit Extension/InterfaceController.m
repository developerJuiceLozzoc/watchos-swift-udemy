//
//  InterfaceController.m
//  SuperCool WatchKit Extension
//
//  Created by Conner M on 7/22/21.
//

#import "InterfaceController.h"


@interface InterfaceController ()

@property(nonatomic, retain) IBOutlet WKInterfaceSlider *temperatureSlider;
@property(nonatomic, retain) IBOutlet WKInterfaceLabel *temperatureLabel;
@end


@implementation InterfaceController


- (IBAction)stepperDidPress:(float)value {
    float result = value * 9/5 + 32;
    [self.temperatureLabel setText: [NSString stringWithFormat:@"%.0f˚F = %.0f˚C",result,value]];
}

- (void)awakeWithContext:(id)context {
}

- (void)willActivate {
    [self.temperatureSlider setValue:0];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
}

@end



