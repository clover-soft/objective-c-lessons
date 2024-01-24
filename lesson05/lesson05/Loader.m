// Loader.m
// lesson05
//
// Created by yakov on 24.01.2024.

#import "Loader.h"

@implementation Loader

#pragma mark - Lazy Initialization

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.HTTPAdditionalHeaders = @{
            @"Content-Type": @"application/json",
            @"Accept": @"application/json",
            @"User-Agent": @"iPhone 15 Pro, iOS 17.2"
        };
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return _session;
}

#pragma mark - GET request

- (void)performGetRequestFromURL:(NSString *)stringURL arguments:(NSDictionary *)arguments block:(void (^)(NSDictionary *, NSError *))block {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:stringURL];
    if (arguments) {
        NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];
        for (NSString *key in arguments) {
            [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:arguments[key]]];
        }
        urlComponents.queryItems = queryItems;
    }
    NSURL *url = urlComponents.URL;
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil, error);
            return;
        }
        NSError *parsingError;
        NSDictionary *dict = [self parseJSONData:data error:&parsingError];
        if (parsingError) {
            block(nil, parsingError);
            return;
        }
        block(dict, nil);
    }];
    [task resume];
}

#pragma mark - JSON Parsing

- (NSDictionary *)parseJSONData:(NSData *)data error:(NSError **)error {
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];
}

#pragma mark - POST request

- (void)performPostRequestFromURL:(NSString *)stringURL arguments:(NSDictionary *)arguments block:(void (^)(NSDictionary *, NSError *))block {
    NSURL *url = [NSURL URLWithString:stringURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    if (arguments) {
        NSData *data = [self dataFromJSON:arguments error:nil]; // Вместо передачи значения nil думаю лучше сделать обработку ошибки
        request.HTTPBody = data;
    }
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            block(nil, error);
            return;
        }
        NSError *parsingError;
        NSDictionary *dict = [self parseJSONData:data error:&parsingError];
        if (parsingError) {
            block(nil, parsingError);
            return;
        }
        block(dict, nil);
    }];
    [task resume];
}

#pragma mark - JSON Serialization

- (NSData *)dataFromJSON:(NSDictionary *)jsonDict error:(NSError **)error {
    return [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:error];
}

@end
