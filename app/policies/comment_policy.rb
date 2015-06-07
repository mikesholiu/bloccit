class CommentPolicy < ApplicationPolicy

def index?
  true
end

def new
end

def create
  user.present?
end 


end
