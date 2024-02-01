class TicketWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1, dead: false
  def perform(seats_id,data,user_id)
    UserMailer.user_ticket(seats_id,data,user_id).deliver_now
  end
end