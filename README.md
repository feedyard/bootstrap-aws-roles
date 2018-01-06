# bootstrap-aws-roles
Basic usage of assume role capability with multi-account architecture

## Profile pipeline

The pipeline managed by feedyard/bootstrap-aws-profile defines the groups to which users or svc accounts can be added.
And it maps those groups to the roles they can assume in other accounts.

## Roles pipeline

Each account has identical roles/role policies. However whether or not users can assume the roles is defined in the
profile account and can therefore be different across acocounts.

This pipeline example uses three accounts: sandbox -> nonprod -> prod  
  
Role configuration is added to each account, pausing for approval to permit thorough testing for validity before
deploying the changes to the next acacount.