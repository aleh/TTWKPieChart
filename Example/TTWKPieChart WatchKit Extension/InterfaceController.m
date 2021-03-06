//
//  TTWKPieChart example
//  Copyright (c) 2015 TouchTribe B.V. All rights reserved.
//

#import "InterfaceController.h"

#import <TTWKPieChart/TTWKPieChart.h>

@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceImage *chartImage;
@end

@implementation InterfaceController {
	UIImage *_image;
}

- (void)awakeWithContext:(id)context {

    [super awakeWithContext:context];

	TTWKPieChart *pieChart = [[TTWKPieChart alloc] init];
	pieChart.radius = floorf([WKInterfaceDevice currentDevice].screenBounds.size.width * 0.45);
	pieChart.bandWidth = 14;

	// Let's keep default colors for the first band
	TTWKPieChartBand *band1 = [[TTWKPieChartBand alloc] init];
	band1.icon = [UIImage imageNamed:@"test-icon-1"];
	band1.caption = @"LOREM";
	band1.backgroundColor = [UIColor colorWithRed:0.1608 green:0.0314 blue:0.0667 alpha:1.0];
	band1.startColor = [UIColor colorWithRed:1.0000 green:0.0941 blue:0.0392 alpha:1.0];
	band1.endColor = [UIColor colorWithRed:1.0000 green:0.0275 blue:0.6392 alpha:1.0];
	band1.value = 0.86;

	// And do a bit of gradient for the second one
	TTWKPieChartBand *band2 = [[TTWKPieChartBand alloc] init];
	band2.icon = [UIImage imageNamed:@"test-icon-2"];
	band2.startColor = [UIColor colorWithRed:0.6275 green:0.9804 blue:0.0510 alpha:1.0];
	band2.endColor = [UIColor colorWithRed:0.8275 green:0.9961 blue:0.0275 alpha:1.0];
	band2.backgroundColor = [UIColor colorWithRed:0.1843 green:0.2667 blue:0.0314 alpha:1.0];
	band2.caption = @"IPSUM";
	band2.value = 0.68;

	pieChart.largeSmallTextPadding = -4;
	pieChart.largeText = [[NSAttributedString alloc]
		initWithString:@"125"
		attributes:@{
			NSFontAttributeName : [UIFont systemFontOfSize:35],
			NSForegroundColorAttributeName : [UIColor whiteColor]
		}
	];
	pieChart.smallText = [[NSAttributedString alloc]
		initWithString:@"PIES"
		attributes:@{
			NSFontAttributeName : [UIFont systemFontOfSize:10],
			NSForegroundColorAttributeName : [UIColor whiteColor]
		}
	];

	pieChart.bands = @[ band1, band2 ];

	_image = [pieChart animatedImageWithFrameRate:15];
	[self.chartImage setImage:_image];
	[self.chartImage stopAnimating];
}

- (void)willActivate {

    [super willActivate];

	[self.chartImage startAnimatingWithImagesInRange:NSMakeRange(0, _image.images.count) duration:_image.duration repeatCount:1];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



