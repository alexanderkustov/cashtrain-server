class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def crowd_index(train_id)
    arr = Feedback.where(train_id: train_id).map(&:overcrowdingScale)
    arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end
  helper_method :crowd_index

end
