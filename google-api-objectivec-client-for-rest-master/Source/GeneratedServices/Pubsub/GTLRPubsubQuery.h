// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Cloud Pub/Sub API (pubsub/v1)
// Description:
//   Provides reliable, many-to-many, asynchronous messaging between
//   applications.
// Documentation:
//   https://cloud.google.com/pubsub/docs

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRQuery.h"
#else
  #import "GTLRQuery.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

@class GTLRPubsub_AcknowledgeRequest;
@class GTLRPubsub_ModifyAckDeadlineRequest;
@class GTLRPubsub_ModifyPushConfigRequest;
@class GTLRPubsub_PublishRequest;
@class GTLRPubsub_PullRequest;
@class GTLRPubsub_SetIamPolicyRequest;
@class GTLRPubsub_Subscription;
@class GTLRPubsub_TestIamPermissionsRequest;
@class GTLRPubsub_Topic;

// Generated comments include content from the discovery document; avoid them
// causing warnings since clang's checks are some what arbitrary.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

NS_ASSUME_NONNULL_BEGIN

/**
 *  Parent class for other Pubsub query classes.
 */
@interface GTLRPubsubQuery : GTLRQuery

/** Selector specifying which fields to include in a partial response. */
@property(nonatomic, copy, nullable) NSString *fields;

@end

/**
 *  Gets the access control policy for a resource.
 *  Returns an empty policy if the resource exists and does not have a policy
 *  set.
 *
 *  Method: pubsub.projects.snapshots.getIamPolicy
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSnapshotsGetIamPolicy : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSnapshotsGetIamPolicyWithresource:]

/**
 *  REQUIRED: The resource for which the policy is being requested.
 *  See the operation documentation for the appropriate value for this field.
 */
@property(nonatomic, copy, nullable) NSString *resource;

/**
 *  Fetches a @c GTLRPubsub_Policy.
 *
 *  Gets the access control policy for a resource.
 *  Returns an empty policy if the resource exists and does not have a policy
 *  set.
 *
 *  @param resource REQUIRED: The resource for which the policy is being
 *    requested.
 *    See the operation documentation for the appropriate value for this field.
 *
 *  @returns GTLRPubsubQuery_ProjectsSnapshotsGetIamPolicy
 */
+ (instancetype)queryWithResource:(NSString *)resource;

@end

/**
 *  Sets the access control policy on the specified resource. Replaces any
 *  existing policy.
 *
 *  Method: pubsub.projects.snapshots.setIamPolicy
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSnapshotsSetIamPolicy : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSnapshotsSetIamPolicyWithObject:resource:]

/**
 *  REQUIRED: The resource for which the policy is being specified.
 *  See the operation documentation for the appropriate value for this field.
 */
@property(nonatomic, copy, nullable) NSString *resource;

/**
 *  Fetches a @c GTLRPubsub_Policy.
 *
 *  Sets the access control policy on the specified resource. Replaces any
 *  existing policy.
 *
 *  @param object The @c GTLRPubsub_SetIamPolicyRequest to include in the query.
 *  @param resource REQUIRED: The resource for which the policy is being
 *    specified.
 *    See the operation documentation for the appropriate value for this field.
 *
 *  @returns GTLRPubsubQuery_ProjectsSnapshotsSetIamPolicy
 */
+ (instancetype)queryWithObject:(GTLRPubsub_SetIamPolicyRequest *)object
                       resource:(NSString *)resource;

@end

/**
 *  Returns permissions that a caller has on the specified resource.
 *  If the resource does not exist, this will return an empty set of
 *  permissions, not a NOT_FOUND error.
 *  Note: This operation is designed to be used for building permission-aware
 *  UIs and command-line tools, not for authorization checking. This operation
 *  may "fail open" without warning.
 *
 *  Method: pubsub.projects.snapshots.testIamPermissions
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSnapshotsTestIamPermissions : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSnapshotsTestIamPermissionsWithObject:resource:]

/**
 *  REQUIRED: The resource for which the policy detail is being requested.
 *  See the operation documentation for the appropriate value for this field.
 */
@property(nonatomic, copy, nullable) NSString *resource;

/**
 *  Fetches a @c GTLRPubsub_TestIamPermissionsResponse.
 *
 *  Returns permissions that a caller has on the specified resource.
 *  If the resource does not exist, this will return an empty set of
 *  permissions, not a NOT_FOUND error.
 *  Note: This operation is designed to be used for building permission-aware
 *  UIs and command-line tools, not for authorization checking. This operation
 *  may "fail open" without warning.
 *
 *  @param object The @c GTLRPubsub_TestIamPermissionsRequest to include in the
 *    query.
 *  @param resource REQUIRED: The resource for which the policy detail is being
 *    requested.
 *    See the operation documentation for the appropriate value for this field.
 *
 *  @returns GTLRPubsubQuery_ProjectsSnapshotsTestIamPermissions
 */
+ (instancetype)queryWithObject:(GTLRPubsub_TestIamPermissionsRequest *)object
                       resource:(NSString *)resource;

@end

/**
 *  Acknowledges the messages associated with the `ack_ids` in the
 *  `AcknowledgeRequest`. The Pub/Sub system can remove the relevant messages
 *  from the subscription.
 *  Acknowledging a message whose ack deadline has expired may succeed,
 *  but such a message may be redelivered later. Acknowledging a message more
 *  than once will not result in an error.
 *
 *  Method: pubsub.projects.subscriptions.acknowledge
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsAcknowledge : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsAcknowledgeWithObject:subscription:]

/**
 *  The subscription whose message is being acknowledged.
 *  Format is `projects/{project}/subscriptions/{sub}`.
 */
@property(nonatomic, copy, nullable) NSString *subscription;

/**
 *  Fetches a @c GTLRPubsub_Empty.
 *
 *  Acknowledges the messages associated with the `ack_ids` in the
 *  `AcknowledgeRequest`. The Pub/Sub system can remove the relevant messages
 *  from the subscription.
 *  Acknowledging a message whose ack deadline has expired may succeed,
 *  but such a message may be redelivered later. Acknowledging a message more
 *  than once will not result in an error.
 *
 *  @param object The @c GTLRPubsub_AcknowledgeRequest to include in the query.
 *  @param subscription The subscription whose message is being acknowledged.
 *    Format is `projects/{project}/subscriptions/{sub}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsAcknowledge
 */
+ (instancetype)queryWithObject:(GTLRPubsub_AcknowledgeRequest *)object
                   subscription:(NSString *)subscription;

@end

/**
 *  Creates a subscription to a given topic.
 *  If the subscription already exists, returns `ALREADY_EXISTS`.
 *  If the corresponding topic doesn't exist, returns `NOT_FOUND`.
 *  If the name is not provided in the request, the server will assign a random
 *  name for this subscription on the same project as the topic, conforming
 *  to the
 *  [resource name format](https://cloud.google.com/pubsub/docs/overview#names).
 *  The generated name is populated in the returned Subscription object.
 *  Note that for REST API requests, you must specify a name in the request.
 *
 *  Method: pubsub.projects.subscriptions.create
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsCreate : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsCreateWithObject:name:]

/**
 *  The name of the subscription. It must have the format
 *  `"projects/{project}/subscriptions/{subscription}"`. `{subscription}` must
 *  start with a letter, and contain only letters (`[A-Za-z]`), numbers
 *  (`[0-9]`), dashes (`-`), underscores (`_`), periods (`.`), tildes (`~`),
 *  plus (`+`) or percent signs (`%`). It must be between 3 and 255 characters
 *  in length, and it must not start with `"goog"`.
 */
@property(nonatomic, copy, nullable) NSString *name;

/**
 *  Fetches a @c GTLRPubsub_Subscription.
 *
 *  Creates a subscription to a given topic.
 *  If the subscription already exists, returns `ALREADY_EXISTS`.
 *  If the corresponding topic doesn't exist, returns `NOT_FOUND`.
 *  If the name is not provided in the request, the server will assign a random
 *  name for this subscription on the same project as the topic, conforming
 *  to the
 *  [resource name format](https://cloud.google.com/pubsub/docs/overview#names).
 *  The generated name is populated in the returned Subscription object.
 *  Note that for REST API requests, you must specify a name in the request.
 *
 *  @param object The @c GTLRPubsub_Subscription to include in the query.
 *  @param name The name of the subscription. It must have the format
 *    `"projects/{project}/subscriptions/{subscription}"`. `{subscription}` must
 *    start with a letter, and contain only letters (`[A-Za-z]`), numbers
 *    (`[0-9]`), dashes (`-`), underscores (`_`), periods (`.`), tildes (`~`),
 *    plus (`+`) or percent signs (`%`). It must be between 3 and 255 characters
 *    in length, and it must not start with `"goog"`.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsCreate
 */
+ (instancetype)queryWithObject:(GTLRPubsub_Subscription *)object
                           name:(NSString *)name;

@end

/**
 *  Deletes an existing subscription. All messages retained in the subscription
 *  are immediately dropped. Calls to `Pull` after deletion will return
 *  `NOT_FOUND`. After a subscription is deleted, a new one may be created with
 *  the same name, but the new one has no association with the old
 *  subscription or its topic unless the same topic is specified.
 *
 *  Method: pubsub.projects.subscriptions.delete
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsDelete : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsDeleteWithsubscription:]

/**
 *  The subscription to delete.
 *  Format is `projects/{project}/subscriptions/{sub}`.
 */
@property(nonatomic, copy, nullable) NSString *subscription;

/**
 *  Fetches a @c GTLRPubsub_Empty.
 *
 *  Deletes an existing subscription. All messages retained in the subscription
 *  are immediately dropped. Calls to `Pull` after deletion will return
 *  `NOT_FOUND`. After a subscription is deleted, a new one may be created with
 *  the same name, but the new one has no association with the old
 *  subscription or its topic unless the same topic is specified.
 *
 *  @param subscription The subscription to delete.
 *    Format is `projects/{project}/subscriptions/{sub}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsDelete
 */
+ (instancetype)queryWithSubscription:(NSString *)subscription;

@end

/**
 *  Gets the configuration details of a subscription.
 *
 *  Method: pubsub.projects.subscriptions.get
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsGet : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsGetWithsubscription:]

/**
 *  The name of the subscription to get.
 *  Format is `projects/{project}/subscriptions/{sub}`.
 */
@property(nonatomic, copy, nullable) NSString *subscription;

/**
 *  Fetches a @c GTLRPubsub_Subscription.
 *
 *  Gets the configuration details of a subscription.
 *
 *  @param subscription The name of the subscription to get.
 *    Format is `projects/{project}/subscriptions/{sub}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsGet
 */
+ (instancetype)queryWithSubscription:(NSString *)subscription;

@end

/**
 *  Gets the access control policy for a resource.
 *  Returns an empty policy if the resource exists and does not have a policy
 *  set.
 *
 *  Method: pubsub.projects.subscriptions.getIamPolicy
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsGetIamPolicy : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsGetIamPolicyWithresource:]

/**
 *  REQUIRED: The resource for which the policy is being requested.
 *  See the operation documentation for the appropriate value for this field.
 */
@property(nonatomic, copy, nullable) NSString *resource;

/**
 *  Fetches a @c GTLRPubsub_Policy.
 *
 *  Gets the access control policy for a resource.
 *  Returns an empty policy if the resource exists and does not have a policy
 *  set.
 *
 *  @param resource REQUIRED: The resource for which the policy is being
 *    requested.
 *    See the operation documentation for the appropriate value for this field.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsGetIamPolicy
 */
+ (instancetype)queryWithResource:(NSString *)resource;

@end

/**
 *  Lists matching subscriptions.
 *
 *  Method: pubsub.projects.subscriptions.list
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsList : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsListWithproject:]

/** Maximum number of subscriptions to return. */
@property(nonatomic, assign) NSInteger pageSize;

/**
 *  The value returned by the last `ListSubscriptionsResponse`; indicates that
 *  this is a continuation of a prior `ListSubscriptions` call, and that the
 *  system should return the next page of data.
 */
@property(nonatomic, copy, nullable) NSString *pageToken;

/**
 *  The name of the cloud project that subscriptions belong to.
 *  Format is `projects/{project}`.
 */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Fetches a @c GTLRPubsub_ListSubscriptionsResponse.
 *
 *  Lists matching subscriptions.
 *
 *  @param project The name of the cloud project that subscriptions belong to.
 *    Format is `projects/{project}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsList
 *
 *  @note Automatic pagination will be done when @c shouldFetchNextPages is
 *        enabled. See @c shouldFetchNextPages on @c GTLRService for more
 *        information.
 */
+ (instancetype)queryWithProject:(NSString *)project;

@end

/**
 *  Modifies the ack deadline for a specific message. This method is useful
 *  to indicate that more time is needed to process a message by the
 *  subscriber, or to make the message available for redelivery if the
 *  processing was interrupted. Note that this does not modify the
 *  subscription-level `ackDeadlineSeconds` used for subsequent messages.
 *
 *  Method: pubsub.projects.subscriptions.modifyAckDeadline
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsModifyAckDeadline : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsModifyAckDeadlineWithObject:subscription:]

/**
 *  The name of the subscription.
 *  Format is `projects/{project}/subscriptions/{sub}`.
 */
@property(nonatomic, copy, nullable) NSString *subscription;

/**
 *  Fetches a @c GTLRPubsub_Empty.
 *
 *  Modifies the ack deadline for a specific message. This method is useful
 *  to indicate that more time is needed to process a message by the
 *  subscriber, or to make the message available for redelivery if the
 *  processing was interrupted. Note that this does not modify the
 *  subscription-level `ackDeadlineSeconds` used for subsequent messages.
 *
 *  @param object The @c GTLRPubsub_ModifyAckDeadlineRequest to include in the
 *    query.
 *  @param subscription The name of the subscription.
 *    Format is `projects/{project}/subscriptions/{sub}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsModifyAckDeadline
 */
+ (instancetype)queryWithObject:(GTLRPubsub_ModifyAckDeadlineRequest *)object
                   subscription:(NSString *)subscription;

@end

/**
 *  Modifies the `PushConfig` for a specified subscription.
 *  This may be used to change a push subscription to a pull one (signified by
 *  an empty `PushConfig`) or vice versa, or change the endpoint URL and other
 *  attributes of a push subscription. Messages will accumulate for delivery
 *  continuously through the call regardless of changes to the `PushConfig`.
 *
 *  Method: pubsub.projects.subscriptions.modifyPushConfig
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsModifyPushConfig : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsModifyPushConfigWithObject:subscription:]

/**
 *  The name of the subscription.
 *  Format is `projects/{project}/subscriptions/{sub}`.
 */
@property(nonatomic, copy, nullable) NSString *subscription;

/**
 *  Fetches a @c GTLRPubsub_Empty.
 *
 *  Modifies the `PushConfig` for a specified subscription.
 *  This may be used to change a push subscription to a pull one (signified by
 *  an empty `PushConfig`) or vice versa, or change the endpoint URL and other
 *  attributes of a push subscription. Messages will accumulate for delivery
 *  continuously through the call regardless of changes to the `PushConfig`.
 *
 *  @param object The @c GTLRPubsub_ModifyPushConfigRequest to include in the
 *    query.
 *  @param subscription The name of the subscription.
 *    Format is `projects/{project}/subscriptions/{sub}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsModifyPushConfig
 */
+ (instancetype)queryWithObject:(GTLRPubsub_ModifyPushConfigRequest *)object
                   subscription:(NSString *)subscription;

@end

/**
 *  Pulls messages from the server. Returns an empty list if there are no
 *  messages available in the backlog. The server may return `UNAVAILABLE` if
 *  there are too many concurrent pull requests pending for the given
 *  subscription.
 *
 *  Method: pubsub.projects.subscriptions.pull
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsPull : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsPullWithObject:subscription:]

/**
 *  The subscription from which messages should be pulled.
 *  Format is `projects/{project}/subscriptions/{sub}`.
 */
@property(nonatomic, copy, nullable) NSString *subscription;

/**
 *  Fetches a @c GTLRPubsub_PullResponse.
 *
 *  Pulls messages from the server. Returns an empty list if there are no
 *  messages available in the backlog. The server may return `UNAVAILABLE` if
 *  there are too many concurrent pull requests pending for the given
 *  subscription.
 *
 *  @param object The @c GTLRPubsub_PullRequest to include in the query.
 *  @param subscription The subscription from which messages should be pulled.
 *    Format is `projects/{project}/subscriptions/{sub}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsPull
 */
+ (instancetype)queryWithObject:(GTLRPubsub_PullRequest *)object
                   subscription:(NSString *)subscription;

@end

/**
 *  Sets the access control policy on the specified resource. Replaces any
 *  existing policy.
 *
 *  Method: pubsub.projects.subscriptions.setIamPolicy
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsSetIamPolicy : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsSetIamPolicyWithObject:resource:]

/**
 *  REQUIRED: The resource for which the policy is being specified.
 *  See the operation documentation for the appropriate value for this field.
 */
@property(nonatomic, copy, nullable) NSString *resource;

/**
 *  Fetches a @c GTLRPubsub_Policy.
 *
 *  Sets the access control policy on the specified resource. Replaces any
 *  existing policy.
 *
 *  @param object The @c GTLRPubsub_SetIamPolicyRequest to include in the query.
 *  @param resource REQUIRED: The resource for which the policy is being
 *    specified.
 *    See the operation documentation for the appropriate value for this field.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsSetIamPolicy
 */
+ (instancetype)queryWithObject:(GTLRPubsub_SetIamPolicyRequest *)object
                       resource:(NSString *)resource;

@end

/**
 *  Returns permissions that a caller has on the specified resource.
 *  If the resource does not exist, this will return an empty set of
 *  permissions, not a NOT_FOUND error.
 *  Note: This operation is designed to be used for building permission-aware
 *  UIs and command-line tools, not for authorization checking. This operation
 *  may "fail open" without warning.
 *
 *  Method: pubsub.projects.subscriptions.testIamPermissions
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsSubscriptionsTestIamPermissions : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsSubscriptionsTestIamPermissionsWithObject:resource:]

/**
 *  REQUIRED: The resource for which the policy detail is being requested.
 *  See the operation documentation for the appropriate value for this field.
 */
@property(nonatomic, copy, nullable) NSString *resource;

/**
 *  Fetches a @c GTLRPubsub_TestIamPermissionsResponse.
 *
 *  Returns permissions that a caller has on the specified resource.
 *  If the resource does not exist, this will return an empty set of
 *  permissions, not a NOT_FOUND error.
 *  Note: This operation is designed to be used for building permission-aware
 *  UIs and command-line tools, not for authorization checking. This operation
 *  may "fail open" without warning.
 *
 *  @param object The @c GTLRPubsub_TestIamPermissionsRequest to include in the
 *    query.
 *  @param resource REQUIRED: The resource for which the policy detail is being
 *    requested.
 *    See the operation documentation for the appropriate value for this field.
 *
 *  @returns GTLRPubsubQuery_ProjectsSubscriptionsTestIamPermissions
 */
+ (instancetype)queryWithObject:(GTLRPubsub_TestIamPermissionsRequest *)object
                       resource:(NSString *)resource;

@end

/**
 *  Creates the given topic with the given name.
 *
 *  Method: pubsub.projects.topics.create
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsTopicsCreate : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsTopicsCreateWithObject:name:]

/**
 *  The name of the topic. It must have the format
 *  `"projects/{project}/topics/{topic}"`. `{topic}` must start with a letter,
 *  and contain only letters (`[A-Za-z]`), numbers (`[0-9]`), dashes (`-`),
 *  underscores (`_`), periods (`.`), tildes (`~`), plus (`+`) or percent
 *  signs (`%`). It must be between 3 and 255 characters in length, and it
 *  must not start with `"goog"`.
 */
@property(nonatomic, copy, nullable) NSString *name;

/**
 *  Fetches a @c GTLRPubsub_Topic.
 *
 *  Creates the given topic with the given name.
 *
 *  @param object The @c GTLRPubsub_Topic to include in the query.
 *  @param name The name of the topic. It must have the format
 *    `"projects/{project}/topics/{topic}"`. `{topic}` must start with a letter,
 *    and contain only letters (`[A-Za-z]`), numbers (`[0-9]`), dashes (`-`),
 *    underscores (`_`), periods (`.`), tildes (`~`), plus (`+`) or percent
 *    signs (`%`). It must be between 3 and 255 characters in length, and it
 *    must not start with `"goog"`.
 *
 *  @returns GTLRPubsubQuery_ProjectsTopicsCreate
 */
+ (instancetype)queryWithObject:(GTLRPubsub_Topic *)object
                           name:(NSString *)name;

@end

/**
 *  Deletes the topic with the given name. Returns `NOT_FOUND` if the topic
 *  does not exist. After a topic is deleted, a new topic may be created with
 *  the same name; this is an entirely new topic with none of the old
 *  configuration or subscriptions. Existing subscriptions to this topic are
 *  not deleted, but their `topic` field is set to `_deleted-topic_`.
 *
 *  Method: pubsub.projects.topics.delete
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsTopicsDelete : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsTopicsDeleteWithtopic:]

/**
 *  Name of the topic to delete.
 *  Format is `projects/{project}/topics/{topic}`.
 */
@property(nonatomic, copy, nullable) NSString *topic;

/**
 *  Fetches a @c GTLRPubsub_Empty.
 *
 *  Deletes the topic with the given name. Returns `NOT_FOUND` if the topic
 *  does not exist. After a topic is deleted, a new topic may be created with
 *  the same name; this is an entirely new topic with none of the old
 *  configuration or subscriptions. Existing subscriptions to this topic are
 *  not deleted, but their `topic` field is set to `_deleted-topic_`.
 *
 *  @param topic Name of the topic to delete.
 *    Format is `projects/{project}/topics/{topic}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsTopicsDelete
 */
+ (instancetype)queryWithTopic:(NSString *)topic;

@end

/**
 *  Gets the configuration of a topic.
 *
 *  Method: pubsub.projects.topics.get
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsTopicsGet : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsTopicsGetWithtopic:]

/**
 *  The name of the topic to get.
 *  Format is `projects/{project}/topics/{topic}`.
 */
@property(nonatomic, copy, nullable) NSString *topic;

/**
 *  Fetches a @c GTLRPubsub_Topic.
 *
 *  Gets the configuration of a topic.
 *
 *  @param topic The name of the topic to get.
 *    Format is `projects/{project}/topics/{topic}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsTopicsGet
 */
+ (instancetype)queryWithTopic:(NSString *)topic;

@end

/**
 *  Gets the access control policy for a resource.
 *  Returns an empty policy if the resource exists and does not have a policy
 *  set.
 *
 *  Method: pubsub.projects.topics.getIamPolicy
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsTopicsGetIamPolicy : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsTopicsGetIamPolicyWithresource:]

/**
 *  REQUIRED: The resource for which the policy is being requested.
 *  See the operation documentation for the appropriate value for this field.
 */
@property(nonatomic, copy, nullable) NSString *resource;

/**
 *  Fetches a @c GTLRPubsub_Policy.
 *
 *  Gets the access control policy for a resource.
 *  Returns an empty policy if the resource exists and does not have a policy
 *  set.
 *
 *  @param resource REQUIRED: The resource for which the policy is being
 *    requested.
 *    See the operation documentation for the appropriate value for this field.
 *
 *  @returns GTLRPubsubQuery_ProjectsTopicsGetIamPolicy
 */
+ (instancetype)queryWithResource:(NSString *)resource;

@end

/**
 *  Lists matching topics.
 *
 *  Method: pubsub.projects.topics.list
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsTopicsList : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsTopicsListWithproject:]

/** Maximum number of topics to return. */
@property(nonatomic, assign) NSInteger pageSize;

/**
 *  The value returned by the last `ListTopicsResponse`; indicates that this is
 *  a continuation of a prior `ListTopics` call, and that the system should
 *  return the next page of data.
 */
@property(nonatomic, copy, nullable) NSString *pageToken;

/**
 *  The name of the cloud project that topics belong to.
 *  Format is `projects/{project}`.
 */
@property(nonatomic, copy, nullable) NSString *project;

/**
 *  Fetches a @c GTLRPubsub_ListTopicsResponse.
 *
 *  Lists matching topics.
 *
 *  @param project The name of the cloud project that topics belong to.
 *    Format is `projects/{project}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsTopicsList
 *
 *  @note Automatic pagination will be done when @c shouldFetchNextPages is
 *        enabled. See @c shouldFetchNextPages on @c GTLRService for more
 *        information.
 */
+ (instancetype)queryWithProject:(NSString *)project;

@end

/**
 *  Adds one or more messages to the topic. Returns `NOT_FOUND` if the topic
 *  does not exist. The message payload must not be empty; it must contain
 *  either a non-empty data field, or at least one attribute.
 *
 *  Method: pubsub.projects.topics.publish
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsTopicsPublish : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsTopicsPublishWithObject:topic:]

/**
 *  The messages in the request will be published on this topic.
 *  Format is `projects/{project}/topics/{topic}`.
 */
@property(nonatomic, copy, nullable) NSString *topic;

/**
 *  Fetches a @c GTLRPubsub_PublishResponse.
 *
 *  Adds one or more messages to the topic. Returns `NOT_FOUND` if the topic
 *  does not exist. The message payload must not be empty; it must contain
 *  either a non-empty data field, or at least one attribute.
 *
 *  @param object The @c GTLRPubsub_PublishRequest to include in the query.
 *  @param topic The messages in the request will be published on this topic.
 *    Format is `projects/{project}/topics/{topic}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsTopicsPublish
 */
+ (instancetype)queryWithObject:(GTLRPubsub_PublishRequest *)object
                          topic:(NSString *)topic;

@end

/**
 *  Sets the access control policy on the specified resource. Replaces any
 *  existing policy.
 *
 *  Method: pubsub.projects.topics.setIamPolicy
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsTopicsSetIamPolicy : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsTopicsSetIamPolicyWithObject:resource:]

/**
 *  REQUIRED: The resource for which the policy is being specified.
 *  See the operation documentation for the appropriate value for this field.
 */
@property(nonatomic, copy, nullable) NSString *resource;

/**
 *  Fetches a @c GTLRPubsub_Policy.
 *
 *  Sets the access control policy on the specified resource. Replaces any
 *  existing policy.
 *
 *  @param object The @c GTLRPubsub_SetIamPolicyRequest to include in the query.
 *  @param resource REQUIRED: The resource for which the policy is being
 *    specified.
 *    See the operation documentation for the appropriate value for this field.
 *
 *  @returns GTLRPubsubQuery_ProjectsTopicsSetIamPolicy
 */
+ (instancetype)queryWithObject:(GTLRPubsub_SetIamPolicyRequest *)object
                       resource:(NSString *)resource;

@end

/**
 *  Lists the name of the subscriptions for this topic.
 *
 *  Method: pubsub.projects.topics.subscriptions.list
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsTopicsSubscriptionsList : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsTopicsSubscriptionsListWithtopic:]

/** Maximum number of subscription names to return. */
@property(nonatomic, assign) NSInteger pageSize;

/**
 *  The value returned by the last `ListTopicSubscriptionsResponse`; indicates
 *  that this is a continuation of a prior `ListTopicSubscriptions` call, and
 *  that the system should return the next page of data.
 */
@property(nonatomic, copy, nullable) NSString *pageToken;

/**
 *  The name of the topic that subscriptions are attached to.
 *  Format is `projects/{project}/topics/{topic}`.
 */
@property(nonatomic, copy, nullable) NSString *topic;

/**
 *  Fetches a @c GTLRPubsub_ListTopicSubscriptionsResponse.
 *
 *  Lists the name of the subscriptions for this topic.
 *
 *  @param topic The name of the topic that subscriptions are attached to.
 *    Format is `projects/{project}/topics/{topic}`.
 *
 *  @returns GTLRPubsubQuery_ProjectsTopicsSubscriptionsList
 */
+ (instancetype)queryWithTopic:(NSString *)topic;

@end

/**
 *  Returns permissions that a caller has on the specified resource.
 *  If the resource does not exist, this will return an empty set of
 *  permissions, not a NOT_FOUND error.
 *  Note: This operation is designed to be used for building permission-aware
 *  UIs and command-line tools, not for authorization checking. This operation
 *  may "fail open" without warning.
 *
 *  Method: pubsub.projects.topics.testIamPermissions
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopePubsub
 *    @c kGTLRAuthScopePubsubCloudPlatform
 */
@interface GTLRPubsubQuery_ProjectsTopicsTestIamPermissions : GTLRPubsubQuery
// Previous library name was
//   +[GTLQueryPubsub queryForProjectsTopicsTestIamPermissionsWithObject:resource:]

/**
 *  REQUIRED: The resource for which the policy detail is being requested.
 *  See the operation documentation for the appropriate value for this field.
 */
@property(nonatomic, copy, nullable) NSString *resource;

/**
 *  Fetches a @c GTLRPubsub_TestIamPermissionsResponse.
 *
 *  Returns permissions that a caller has on the specified resource.
 *  If the resource does not exist, this will return an empty set of
 *  permissions, not a NOT_FOUND error.
 *  Note: This operation is designed to be used for building permission-aware
 *  UIs and command-line tools, not for authorization checking. This operation
 *  may "fail open" without warning.
 *
 *  @param object The @c GTLRPubsub_TestIamPermissionsRequest to include in the
 *    query.
 *  @param resource REQUIRED: The resource for which the policy detail is being
 *    requested.
 *    See the operation documentation for the appropriate value for this field.
 *
 *  @returns GTLRPubsubQuery_ProjectsTopicsTestIamPermissions
 */
+ (instancetype)queryWithObject:(GTLRPubsub_TestIamPermissionsRequest *)object
                       resource:(NSString *)resource;

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop
