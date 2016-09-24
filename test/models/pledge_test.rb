# == Schema Information
#
# Table name: pledges
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  reward_id       :integer
#  amount          :integer
#  shipping        :decimal(, )
#  expiration_date :date
#  uuid            :string
#  name            :string
#  address         :string
#  city            :string
#  country         :string
#  postal_code     :string
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class PledgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
