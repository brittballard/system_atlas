class SoftwaresController < ApplicationController
  before_filter :authenticate_user!
end
