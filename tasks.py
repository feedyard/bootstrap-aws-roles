from invoke import task

@task
def init(ctx):
    ctx.run("terraform init -backend-config $CIRCLE_WORKING_DIRECTORY/backend.conf")

@task
def test(ctx):
    ctx.run("bundle exec rspec spec")

@task
def plan(ctx, account_id, access_key, secret_key, region, profile_account_id):
    cmd = 'terraform plan ' \
          '-var aws_account_id={0} ' \
          '-var aws_access_key={1} ' \
          '-var aws_secret_key={2} ' \
          '-var aws_region={3} ' \
          '-var profile_account_id={4} ' \
          '-backend-config $CIRCLE_WORKING_DIRECTORY/backend.conf'

    ctx.run(cmd.format(account_id, access_key, secret_key, region, profile_account_id))

@task
def apply(ctx):
    cmd = 'terraform apply ' \
          '-var account_id=$account_id ' \
          '-var access_key=$access_key ' \
          '-var secret_key=$secret_key ' \
          '-var region=$region'

    ctx.run(cmd)

@task
def destroy(ctx):
    cmd = 'terraform destroy ' \
          '-var account_id=$account_id ' \
          '-var access_key=$access_key ' \
          '-var secret_key=$secret_key ' \
          '-var region=$region -force'

    ctx.run(cmd)



@task
def enc(ctx, keyfile):
    ctx.run("openssl aes-256-cbc -e -in {} -out env.ci -k $KEY".format(keyfile))

@task
def dec(ctx):
    ctx.run("openssl aes-256-cbc -d -in env.ci -out env -k $KEY")

