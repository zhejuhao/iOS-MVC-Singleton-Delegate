//
//  Single.m
//  Test
//
//  Created by li qi on 2017/6/19.
//  Copyright © 2017年 li qi. All rights reserved.
//

#import "Single.h"
static Single *single = nil;

@implementation Single
+(Single *)shareSingle{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[self alloc] init];
    });
    return single;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [super allocWithZone:zone];
    });
    return single;
}
-(instancetype)copy{
    return single;
}

-(instancetype)mutableCopy{
    return single;
}


- (void)sendString{
    if ([self.delegate respondsToSelector:@selector(showStringWithString:)]) {
        [self.delegate showStringWithString:@"hihihi"];
    }
}

@end
