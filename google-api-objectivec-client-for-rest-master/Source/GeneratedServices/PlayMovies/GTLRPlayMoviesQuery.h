// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Play Movies Partner API (playmoviespartner/v1)
// Description:
//   Gets the delivery status of titles for Google Play Movies Partners.
// Documentation:
//   https://developers.google.com/playmoviespartner/

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRQuery.h"
#else
  #import "GTLRQuery.h"
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
// Constants - For some of the query classes' properties below.

// ----------------------------------------------------------------------------
// status

/** Value: "STATUS_APPROVED" */
GTLR_EXTERN NSString * const kGTLRPlayMoviesStatusStatusApproved;
/** Value: "STATUS_FAILED" */
GTLR_EXTERN NSString * const kGTLRPlayMoviesStatusStatusFailed;
/** Value: "STATUS_NOT_AVAILABLE" */
GTLR_EXTERN NSString * const kGTLRPlayMoviesStatusStatusNotAvailable;
/** Value: "STATUS_PROCESSING" */
GTLR_EXTERN NSString * const kGTLRPlayMoviesStatusStatusProcessing;
/** Value: "STATUS_UNFULFILLED" */
GTLR_EXTERN NSString * const kGTLRPlayMoviesStatusStatusUnfulfilled;
/** Value: "STATUS_UNSPECIFIED" */
GTLR_EXTERN NSString * const kGTLRPlayMoviesStatusStatusUnspecified;

// ----------------------------------------------------------------------------
// Query Classes
//

/**
 *  Parent class for other Play Movies query classes.
 */
@interface GTLRPlayMoviesQuery : GTLRQuery

/** Selector specifying which fields to include in a partial response. */
@property(nonatomic, copy, nullable) NSString *fields;

@end

/**
 *  Get an Avail given its avail group id and avail id.
 *
 *  Method: playmoviespartner.accounts.avails.get
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePlayMoviesPlaymoviesPartnerReadonly
 */
@interface GTLRPlayMoviesQuery_AccountsAvailsGet : GTLRPlayMoviesQuery
// Previous library name was
//   +[GTLQueryPlayMovies queryForAccountsAvailsGetWithaccountId:availId:]

/** REQUIRED. See _General rules_ for more information about this field. */
@property(nonatomic, copy, nullable) NSString *accountId;

/** REQUIRED. Avail ID. */
@property(nonatomic, copy, nullable) NSString *availId;

/**
 *  Fetches a @c GTLRPlayMovies_Avail.
 *
 *  Get an Avail given its avail group id and avail id.
 *
 *  @param accountId REQUIRED. See _General rules_ for more information about
 *    this field.
 *  @param availId REQUIRED. Avail ID.
 *
 *  @returns GTLRPlayMoviesQuery_AccountsAvailsGet
 */
+ (instancetype)queryWithAccountId:(NSString *)accountId
                           availId:(NSString *)availId;

@end

/**
 *  List Avails owned or managed by the partner.
 *  See _Authentication and Authorization rules_ and
 *  _List methods rules_ for more information about this method.
 *
 *  Method: playmoviespartner.accounts.avails.list
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePlayMoviesPlaymoviesPartnerReadonly
 */
@interface GTLRPlayMoviesQuery_AccountsAvailsList : GTLRPlayMoviesQuery
// Previous library name was
//   +[GTLQueryPlayMovies queryForAccountsAvailsListWithaccountId:]

/** REQUIRED. See _General rules_ for more information about this field. */
@property(nonatomic, copy, nullable) NSString *accountId;

/**
 *  Filter Avails that match a case-insensitive, partner-specific custom id.
 *  NOTE: this field is deprecated and will be removed on V2; `alt_ids`
 *  should be used instead.
 */
@property(nonatomic, copy, nullable) NSString *altId;

/**
 *  Filter Avails that match (case-insensitive) any of the given
 *  partner-specific custom ids.
 */
@property(nonatomic, strong, nullable) NSArray<NSString *> *altIds;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, assign) NSInteger pageSize;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, copy, nullable) NSString *pageToken;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *pphNames;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *studioNames;

/**
 *  Filter Avails that match (case-insensitive) any of the given country codes,
 *  using the "ISO 3166-1 alpha-2" format (examples: "US", "us", "Us").
 */
@property(nonatomic, strong, nullable) NSArray<NSString *> *territories;

/**
 *  Filter that matches Avails with a `title_internal_alias`,
 *  `series_title_internal_alias`, `season_title_internal_alias`,
 *  or `episode_title_internal_alias` that contains the given
 *  case-insensitive title.
 */
@property(nonatomic, copy, nullable) NSString *title;

/** Filter Avails that match any of the given `video_id`s. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *videoIds;

/**
 *  Fetches a @c GTLRPlayMovies_ListAvailsResponse.
 *
 *  List Avails owned or managed by the partner.
 *  See _Authentication and Authorization rules_ and
 *  _List methods rules_ for more information about this method.
 *
 *  @param accountId REQUIRED. See _General rules_ for more information about
 *    this field.
 *
 *  @returns GTLRPlayMoviesQuery_AccountsAvailsList
 *
 *  @note Automatic pagination will be done when @c shouldFetchNextPages is
 *        enabled. See @c shouldFetchNextPages on @c GTLRService for more
 *        information.
 */
+ (instancetype)queryWithAccountId:(NSString *)accountId;

@end

/**
 *  Get an Order given its id.
 *  See _Authentication and Authorization rules_ and
 *  _Get methods rules_ for more information about this method.
 *
 *  Method: playmoviespartner.accounts.orders.get
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePlayMoviesPlaymoviesPartnerReadonly
 */
@interface GTLRPlayMoviesQuery_AccountsOrdersGet : GTLRPlayMoviesQuery
// Previous library name was
//   +[GTLQueryPlayMovies queryForAccountsOrdersGetWithaccountId:orderId:]

/** REQUIRED. See _General rules_ for more information about this field. */
@property(nonatomic, copy, nullable) NSString *accountId;

/** REQUIRED. Order ID. */
@property(nonatomic, copy, nullable) NSString *orderId;

/**
 *  Fetches a @c GTLRPlayMovies_Order.
 *
 *  Get an Order given its id.
 *  See _Authentication and Authorization rules_ and
 *  _Get methods rules_ for more information about this method.
 *
 *  @param accountId REQUIRED. See _General rules_ for more information about
 *    this field.
 *  @param orderId REQUIRED. Order ID.
 *
 *  @returns GTLRPlayMoviesQuery_AccountsOrdersGet
 */
+ (instancetype)queryWithAccountId:(NSString *)accountId
                           orderId:(NSString *)orderId;

@end

/**
 *  List Orders owned or managed by the partner.
 *  See _Authentication and Authorization rules_ and
 *  _List methods rules_ for more information about this method.
 *
 *  Method: playmoviespartner.accounts.orders.list
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePlayMoviesPlaymoviesPartnerReadonly
 */
@interface GTLRPlayMoviesQuery_AccountsOrdersList : GTLRPlayMoviesQuery
// Previous library name was
//   +[GTLQueryPlayMovies queryForAccountsOrdersListWithaccountId:]

/** REQUIRED. See _General rules_ for more information about this field. */
@property(nonatomic, copy, nullable) NSString *accountId;

/**
 *  Filter Orders that match a case-insensitive, partner-specific custom id.
 */
@property(nonatomic, copy, nullable) NSString *customId;

/**
 *  Filter that matches Orders with a `name`, `show`, `season` or `episode`
 *  that contains the given case-insensitive name.
 */
@property(nonatomic, copy, nullable) NSString *name;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, assign) NSInteger pageSize;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, copy, nullable) NSString *pageToken;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *pphNames;

/**
 *  Filter Orders that match one of the given status.
 *
 *  Likely values:
 *    @arg @c kGTLRPlayMoviesStatusStatusUnspecified Value "STATUS_UNSPECIFIED"
 *    @arg @c kGTLRPlayMoviesStatusStatusApproved Value "STATUS_APPROVED"
 *    @arg @c kGTLRPlayMoviesStatusStatusFailed Value "STATUS_FAILED"
 *    @arg @c kGTLRPlayMoviesStatusStatusProcessing Value "STATUS_PROCESSING"
 *    @arg @c kGTLRPlayMoviesStatusStatusUnfulfilled Value "STATUS_UNFULFILLED"
 *    @arg @c kGTLRPlayMoviesStatusStatusNotAvailable Value
 *        "STATUS_NOT_AVAILABLE"
 */
@property(nonatomic, strong, nullable) NSArray<NSString *> *status;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *studioNames;

/** Filter Orders that match any of the given `video_id`s. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *videoIds;

/**
 *  Fetches a @c GTLRPlayMovies_ListOrdersResponse.
 *
 *  List Orders owned or managed by the partner.
 *  See _Authentication and Authorization rules_ and
 *  _List methods rules_ for more information about this method.
 *
 *  @param accountId REQUIRED. See _General rules_ for more information about
 *    this field.
 *
 *  @returns GTLRPlayMoviesQuery_AccountsOrdersList
 *
 *  @note Automatic pagination will be done when @c shouldFetchNextPages is
 *        enabled. See @c shouldFetchNextPages on @c GTLRService for more
 *        information.
 */
+ (instancetype)queryWithAccountId:(NSString *)accountId;

@end

/**
 *  Get a StoreInfo given its video id and country.
 *  See _Authentication and Authorization rules_ and
 *  _Get methods rules_ for more information about this method.
 *
 *  Method: playmoviespartner.accounts.storeInfos.country.get
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePlayMoviesPlaymoviesPartnerReadonly
 */
@interface GTLRPlayMoviesQuery_AccountsStoreInfosCountryGet : GTLRPlayMoviesQuery
// Previous library name was
//   +[GTLQueryPlayMovies queryForAccountsStoreInfosCountryGetWithaccountId:videoId:country:]

/** REQUIRED. See _General rules_ for more information about this field. */
@property(nonatomic, copy, nullable) NSString *accountId;

/** REQUIRED. Edit country. */
@property(nonatomic, copy, nullable) NSString *country;

/** REQUIRED. Video ID. */
@property(nonatomic, copy, nullable) NSString *videoId;

/**
 *  Fetches a @c GTLRPlayMovies_StoreInfo.
 *
 *  Get a StoreInfo given its video id and country.
 *  See _Authentication and Authorization rules_ and
 *  _Get methods rules_ for more information about this method.
 *
 *  @param accountId REQUIRED. See _General rules_ for more information about
 *    this field.
 *  @param videoId REQUIRED. Video ID.
 *  @param country REQUIRED. Edit country.
 *
 *  @returns GTLRPlayMoviesQuery_AccountsStoreInfosCountryGet
 */
+ (instancetype)queryWithAccountId:(NSString *)accountId
                           videoId:(NSString *)videoId
                           country:(NSString *)country;

@end

/**
 *  List StoreInfos owned or managed by the partner.
 *  See _Authentication and Authorization rules_ and
 *  _List methods rules_ for more information about this method.
 *
 *  Method: playmoviespartner.accounts.storeInfos.list
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePlayMoviesPlaymoviesPartnerReadonly
 */
@interface GTLRPlayMoviesQuery_AccountsStoreInfosList : GTLRPlayMoviesQuery
// Previous library name was
//   +[GTLQueryPlayMovies queryForAccountsStoreInfosListWithaccountId:]

/** REQUIRED. See _General rules_ for more information about this field. */
@property(nonatomic, copy, nullable) NSString *accountId;

/**
 *  Filter StoreInfos that match (case-insensitive) any of the given country
 *  codes, using the "ISO 3166-1 alpha-2" format (examples: "US", "us", "Us").
 */
@property(nonatomic, strong, nullable) NSArray<NSString *> *countries;

/** Filter StoreInfos that match any of the given `mid`s. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *mids;

/**
 *  Filter that matches StoreInfos with a `name` or `show_name`
 *  that contains the given case-insensitive name.
 */
@property(nonatomic, copy, nullable) NSString *name;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, assign) NSInteger pageSize;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, copy, nullable) NSString *pageToken;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *pphNames;

/** Filter StoreInfos that match any of the given `season_id`s. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *seasonIds;

/** See _List methods rules_ for info about this field. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *studioNames;

/**
 *  Filter StoreInfos that match a given `video_id`.
 *  NOTE: this field is deprecated and will be removed on V2; `video_ids`
 *  should be used instead.
 */
@property(nonatomic, copy, nullable) NSString *videoId;

/** Filter StoreInfos that match any of the given `video_id`s. */
@property(nonatomic, strong, nullable) NSArray<NSString *> *videoIds;

/**
 *  Fetches a @c GTLRPlayMovies_ListStoreInfosResponse.
 *
 *  List StoreInfos owned or managed by the partner.
 *  See _Authentication and Authorization rules_ and
 *  _List methods rules_ for more information about this method.
 *
 *  @param accountId REQUIRED. See _General rules_ for more information about
 *    this field.
 *
 *  @returns GTLRPlayMoviesQuery_AccountsStoreInfosList
 *
 *  @note Automatic pagination will be done when @c shouldFetchNextPages is
 *        enabled. See @c shouldFetchNextPages on @c GTLRService for more
 *        information.
 */
+ (instancetype)queryWithAccountId:(NSString *)accountId;

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop
