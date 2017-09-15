class UserPolicy < ApplicationPolicy

	def show?
		return true 
	end
	
	def index?
	   return true
	end

	def edit?
		return true if user_or_admin
	end

	def update?
		return true if user_or_admin
	end


	private
		def user_or_admin
			record && (record.id == user.id || admin?)
		end

		def admin?
			admin_types.include?(user.type)
		end


end