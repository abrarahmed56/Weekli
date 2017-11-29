// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Google Cloud OS Login API (oslogin/v1alpha)
// Description:
//   Manages OS login configuration for Directory API users.
// Documentation:
//   https://cloud.google.com/compute/docs/oslogin/rest/

#if GTLR_BUILT_AS_FRAMEWORK
  #import "GTLR/GTLRQuery.h"
#else
  #import "GTLRQuery.h"
#endif

#if GTLR_RUNTIME_VERSION != 3000
#error This file was generated by a different version of ServiceGenerator which is incompatible with this GTLR library source.
#endif

@class GTLRCloudOSLogin_SshPublicKey;

// Generated comments include content from the discovery document; avoid them
// causing warnings since clang's checks are some what arbitrary.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

NS_ASSUME_NONNULL_BEGIN

/**
 *  Parent class for other Cloud OS Login query classes.
 */
@interface GTLRCloudOSLoginQuery : GTLRQuery

/** Selector specifying which fields to include in a partial response. */
@property(nonatomic, copy, nullable) NSString *fields;

@end

/**
 *  Retrieves the profile information used for logging in to a virtual machine
 *  on Google Compute Engine.
 *
 *  Method: oslogin.users.getLoginProfile
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeCloudOSLoginCloudPlatform
 *    @c kGTLRAuthScopeCloudOSLoginCloudPlatformReadOnly
 *    @c kGTLRAuthScopeCloudOSLoginCompute
 *    @c kGTLRAuthScopeCloudOSLoginComputeReadonly
 */
@interface GTLRCloudOSLoginQuery_UsersGetLoginProfile : GTLRCloudOSLoginQuery
// Previous library name was
//   +[GTLQueryCloudOSLogin queryForUsersGetLoginProfileWithname:]

/** The unique ID for the user in format `users/{user}`. */
@property(nonatomic, copy, nullable) NSString *name;

/**
 *  Fetches a @c GTLRCloudOSLogin_LoginProfile.
 *
 *  Retrieves the profile information used for logging in to a virtual machine
 *  on Google Compute Engine.
 *
 *  @param name The unique ID for the user in format `users/{user}`.
 *
 *  @returns GTLRCloudOSLoginQuery_UsersGetLoginProfile
 */
+ (instancetype)queryWithName:(NSString *)name;

@end

/**
 *  Adds an SSH public key and returns the profile information. Default POSIX
 *  account information is set when no username and UID exist as part of the
 *  login profile.
 *
 *  Method: oslogin.users.importSshPublicKey
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeCloudOSLoginCloudPlatform
 *    @c kGTLRAuthScopeCloudOSLoginCompute
 */
@interface GTLRCloudOSLoginQuery_UsersImportSshPublicKey : GTLRCloudOSLoginQuery
// Previous library name was
//   +[GTLQueryCloudOSLogin queryForUsersImportSshPublicKeyWithObject:parent:]

/** The unique ID for the user in format `users/{user}`. */
@property(nonatomic, copy, nullable) NSString *parent;

/**
 *  Fetches a @c GTLRCloudOSLogin_ImportSshPublicKeyResponse.
 *
 *  Adds an SSH public key and returns the profile information. Default POSIX
 *  account information is set when no username and UID exist as part of the
 *  login profile.
 *
 *  @param object The @c GTLRCloudOSLogin_SshPublicKey to include in the query.
 *  @param parent The unique ID for the user in format `users/{user}`.
 *
 *  @returns GTLRCloudOSLoginQuery_UsersImportSshPublicKey
 */
+ (instancetype)queryWithObject:(GTLRCloudOSLogin_SshPublicKey *)object
                         parent:(NSString *)parent;

@end

/**
 *  Deletes an SSH public key.
 *
 *  Method: oslogin.users.sshPublicKeys.delete
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeCloudOSLoginCloudPlatform
 *    @c kGTLRAuthScopeCloudOSLoginCompute
 */
@interface GTLRCloudOSLoginQuery_UsersSshPublicKeysDelete : GTLRCloudOSLoginQuery
// Previous library name was
//   +[GTLQueryCloudOSLogin queryForUsersSshPublicKeysDeleteWithname:]

/**
 *  The fingerprint of the public key to update. Public keys are identified by
 *  their SHA-256 fingerprint. The fingerprint of the public key is in format
 *  `users/{user}/sshPublicKeys/{fingerprint}`.
 */
@property(nonatomic, copy, nullable) NSString *name;

/**
 *  Fetches a @c GTLRCloudOSLogin_Empty.
 *
 *  Deletes an SSH public key.
 *
 *  @param name The fingerprint of the public key to update. Public keys are
 *    identified by
 *    their SHA-256 fingerprint. The fingerprint of the public key is in format
 *    `users/{user}/sshPublicKeys/{fingerprint}`.
 *
 *  @returns GTLRCloudOSLoginQuery_UsersSshPublicKeysDelete
 */
+ (instancetype)queryWithName:(NSString *)name;

@end

/**
 *  Retrieves an SSH public key.
 *
 *  Method: oslogin.users.sshPublicKeys.get
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeCloudOSLoginCloudPlatform
 *    @c kGTLRAuthScopeCloudOSLoginCompute
 */
@interface GTLRCloudOSLoginQuery_UsersSshPublicKeysGet : GTLRCloudOSLoginQuery
// Previous library name was
//   +[GTLQueryCloudOSLogin queryForUsersSshPublicKeysGetWithname:]

/**
 *  The fingerprint of the public key to retrieve. Public keys are identified
 *  by their SHA-256 fingerprint. The fingerprint of the public key is in
 *  format `users/{user}/sshPublicKeys/{fingerprint}`.
 */
@property(nonatomic, copy, nullable) NSString *name;

/**
 *  Fetches a @c GTLRCloudOSLogin_SshPublicKey.
 *
 *  Retrieves an SSH public key.
 *
 *  @param name The fingerprint of the public key to retrieve. Public keys are
 *    identified
 *    by their SHA-256 fingerprint. The fingerprint of the public key is in
 *    format `users/{user}/sshPublicKeys/{fingerprint}`.
 *
 *  @returns GTLRCloudOSLoginQuery_UsersSshPublicKeysGet
 */
+ (instancetype)queryWithName:(NSString *)name;

@end

/**
 *  Updates an SSH public key and returns the profile information. This method
 *  supports patch semantics.
 *
 *  Method: oslogin.users.sshPublicKeys.patch
 *
 *  Authorization scope(s):
 *    @c kGTLRAuthScopeCloudOSLoginCloudPlatform
 *    @c kGTLRAuthScopeCloudOSLoginCompute
 */
@interface GTLRCloudOSLoginQuery_UsersSshPublicKeysPatch : GTLRCloudOSLoginQuery
// Previous library name was
//   +[GTLQueryCloudOSLogin queryForUsersSshPublicKeysPatchWithObject:name:]

/**
 *  The fingerprint of the public key to update. Public keys are identified by
 *  their SHA-256 fingerprint. The fingerprint of the public key is in format
 *  `users/{user}/sshPublicKeys/{fingerprint}`.
 */
@property(nonatomic, copy, nullable) NSString *name;

/**
 *  Mask to control which fields get updated. Updates all if not present.
 *
 *  String format is a comma-separated list of fields.
 */
@property(nonatomic, copy, nullable) NSString *updateMask;

/**
 *  Fetches a @c GTLRCloudOSLogin_SshPublicKey.
 *
 *  Updates an SSH public key and returns the profile information. This method
 *  supports patch semantics.
 *
 *  @param object The @c GTLRCloudOSLogin_SshPublicKey to include in the query.
 *  @param name The fingerprint of the public key to update. Public keys are
 *    identified by
 *    their SHA-256 fingerprint. The fingerprint of the public key is in format
 *    `users/{user}/sshPublicKeys/{fingerprint}`.
 *
 *  @returns GTLRCloudOSLoginQuery_UsersSshPublicKeysPatch
 */
+ (instancetype)queryWithObject:(GTLRCloudOSLogin_SshPublicKey *)object
                           name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

#pragma clang diagnostic pop
