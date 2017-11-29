// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Consumer Surveys API (consumersurveys/v2)
// Description:
//   Creates and conducts surveys, lists the surveys that an authenticated user
//   owns, and retrieves survey results and information about specified surveys.

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRService.h"
#else
  #import "GTLRService.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

// Generated comments include content from the discovery document; avoid them
// causing warnings since clang's checks are some what arbitrary.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

NS_ASSUME_NONNULL_BEGIN

// ----------------------------------------------------------------------------
// Authorization scopes

/**
 *  Authorization scope: View and edit your surveys and results
 *
 *  Value "https://www.googleapis.com/auth/consumersurveys"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeConsumerSurveys;
/**
 *  Authorization scope: View the results for your surveys
 *
 *  Value "https://www.googleapis.com/auth/consumersurveys.readonly"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeConsumerSurveysReadonly;
/**
 *  Authorization scope: View your email address
 *
 *  Value "https://www.googleapis.com/auth/userinfo.email"
 */
GTLR_EXTERN NSString * const kGTLRAuthScopeConsumerSurveysUserinfoEmail;

// ----------------------------------------------------------------------------
//   GTLRConsumerSurveysService
//

/**
 *  Service for executing Consumer Surveys API queries.
 *
 *  Creates and conducts surveys, lists the surveys that an authenticated user
 *  owns, and retrieves survey results and information about specified surveys.
 */
@interface GTLRConsumerSurveysService : GTLRService

// No new methods

// Clients should create a standard query with any of the class methods in
// GTLRConsumerSurveysQuery.h. The query can the be sent with GTLRService's
// execute methods,
//
//   - (GTLRServiceTicket *)executeQuery:(GTLRQuery *)query
//                     completionHandler:(void (^)(GTLRServiceTicket *ticket,
//                                                 id object, NSError *error))handler;
// or
//   - (GTLRServiceTicket *)executeQuery:(GTLRQuery *)query
//                              delegate:(id)delegate
//                     didFinishSelector:(SEL)finishedSelector;
//
// where finishedSelector has a signature of:
//
//   - (void)serviceTicket:(GTLRServiceTicket *)ticket
//      finishedWithObject:(id)object
//                   error:(NSError *)error;
//
// The object passed to the completion handler or delegate method
// is a subclass of GTLRObject, determined by the query method executed.

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop
