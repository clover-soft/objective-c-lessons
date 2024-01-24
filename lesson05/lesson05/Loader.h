// Loader.h
// lesson05
//
// Created by yakov on 24.01.2024.

#ifndef Loader_h
#define Loader_h

#import <Foundation/Foundation.h>

@interface Loader : NSObject

@property (strong, nonatomic) NSURLSession *session;

- (void)performGetRequestFromURL:(NSString *)stringURL
                       arguments:(NSDictionary *)arguments
                           block:(void (^)(NSDictionary *, NSError *))block;

- (void)performPostRequestFromURL:(NSString *)stringURL
                        arguments:(NSDictionary *)arguments
                            block:(void (^)(NSDictionary *, NSError *))block;

- (NSDictionary *)parseJSONData:(NSData *)data error:(NSError **)error;
- (NSData *)dataFromJSON:(NSDictionary *)jsonDict error:(NSError **)error;

@end

#endif /* Loader_h */
