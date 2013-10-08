//
//  WNHomeViewController.h
//  Well Nest
//
//  Created by Narendra Kumar on 08/10/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNCommanViewController.h"
#import "ISHeaderClass.h"
#import <AVFoundation/AVFoundation.h>


@interface WNHomeViewController : WNCommanViewController <AVAudioPlayerDelegate>{

    AVAudioPlayer *data;
}
@end
