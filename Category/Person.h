//
//  Person.h
//  Category
//
//  Created by Roger Luo on 2022/3/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

- (void)run;
@property (strong, nonatomic) NSString* nickname;

@end

NS_ASSUME_NONNULL_END
