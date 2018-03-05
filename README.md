# bootstrap-aws-roles
Basic demo of assume role capability with multi-account architecture

## Profile pipeline

The pipeline managed by feedyard/bootstrap-aws-profiles defines the groups to which users or svc accounts can be added.
And it maps those groups to the roles they can assume in other accounts.

## Roles pipeline

Each account has identical roles/role policies. However whether or not users can assume the roles is defined in the
profile account and can therefore be different across accounts.

This pipeline example uses four accounts: profile -> sandbox -> nonprod -> prod  
  
Role configuration is added to each account, pausing for approval to permit thorough testing for validity before
deploying the changes to the next acacount. Although the testing would be different, the profile account is included in
the role definitions since there other infra pipeline that will manage certain profile account configuration in addition
to the bootstrap-aws-profiles pipeline.

During the bootstrap phase of a greenfield delivery, local accounts are required since this assume role configuration
is not yet in existence. Once it is in place consideration can be given to update these pipelines to make use of the
new, more secure access method.

## Dependencies

See Dockerfile in [circleci-infra-agent](https://github.com/feedyard/circleci-infra-agent) for dependencies  

## circleci implementation

The circleci workflow assumes the expected aws access information is provided via an encrypted file used to define
env variables. See the pipeline config.yml for naming conventions.
