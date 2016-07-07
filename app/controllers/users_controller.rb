class UsersController < ApplicationController
  expose :user
  expose :users do
    User.all
  end
end
