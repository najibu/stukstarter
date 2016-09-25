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

class Pledge < ApplicationRecord
	belongs_to :user
	belongs_to :reward
	before_validation :generate_uuid!, :on => :create 
	validates_presence_of :name, :address, :city, :country, :postal_code, :amount, :user_id
	after_create :check_if_funded

	private
		def generate_uuid!
			begin
				self.uuid = SecureRandom.hex(16)
			end while Pledge.find_by(:uuid => self.uuid).present?
		end

		def check_if_funded
			project.funded! if project.total_backed_amount >= project.goal
		end

		def total_backed_amount
			pledges.map(&:amount).inject(0, :+)
		end

		def charged?
			status == "charged"
		end

		def failed?
			status == "failed"
		end

		def pending?
			status == "pending"
		end

		def charged!
			update(status: "charged")
		end

		def viod!
			update(status: "viod")
		end
end
