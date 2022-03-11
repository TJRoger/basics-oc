//
//  main.m
//  Category
//
//  Created by Roger Luo on 2022/3/9.
//

#import <Foundation/Foundation.h>
#import "Person.h"
//#import "Person+Test.h"
#import "Person+Eat.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        id person = [[Person alloc] init];
        [person run];
        [person test];
        [person eat];
    }
    return 0;
}
