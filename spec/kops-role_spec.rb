# frozen_string_literal: true

require 'spec_helper'

describe iam_role('KopsRole') do
  it { should exist }
  it { should have_iam_policy('KopsRolePolicy') }
  it { should be_allowed_action('route53:*') }
end

describe iam_policy('KopsRolePolicy') do
  it { should exist }
  it { should be_attachable }
  it { should be_attached_to_role('KopsRole') }
end
