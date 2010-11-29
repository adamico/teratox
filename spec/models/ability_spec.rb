require 'spec_helper'
require 'cancan/matchers'

describe Ability do
  context "for an authenticated user" do
    user = Factory.build :user
    subject {Ability.new(user)}
    it {should be_able_to(:read, Dossier)}
    it {should_not be_able_to(:manage, Dossier)}
  end
end
