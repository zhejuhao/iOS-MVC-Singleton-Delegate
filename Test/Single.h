//
//  Single.h
//  Test
//
//  Created by li qi on 2017/6/19.
//  Copyright © 2017年 li qi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TestDelegate<NSObject>

-(void)showStringWithString:(NSString *)str;

@end

@interface Single : NSObject
@property (nonatomic,weak) id<TestDelegate> delegate;

+(Single *)shareSingle;
-(void)sendString;
@end
