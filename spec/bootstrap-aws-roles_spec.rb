# frozen_string_literal: true

require 'spec_helper'

describe iam_role('TerraformRole') do
  it { should exist }
  it { should have_iam_policy('TerraformRolePolicy') }
  it { should be_allowed_action('organizations:DescribeOrganization') }
end

describe iam_policy('TerraformRolePolicy') do
  it { should exist }
  it { should be_attachable }
  it { should be_attached_to_role('TerraformRole') }
end
