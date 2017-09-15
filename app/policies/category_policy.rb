class CategoryPolicy < ApplicationPolicy
	def edit?
		return true if admin?
	end

	def update?
		return true if admin?
	end

	def new?
		return true if admin?
	end

	def create?
		return true if admin?
	end

	private
	def admin?
      user.admin?
  end
    
end