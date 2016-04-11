class Booker < ActiveRecord::Base
  # Model in charge of Paypal operations.
  belongs_to :booking

  def purchase
    response = EXPRESS_GATEWAY.purchase(self.cost_in_cents,
    express_purchase_options)
    self.booking.update_attribute(:booked_at, Time.now) if response.success?
    response.success?
  end

  def express_token=(token)
    self[:express_token] = token
    if new_record? && !token.blank?
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
      self.first_name = details.params["first_name"]
      self.last_name = details.params["last_name"]
    end
  end

  def cost_in_cents
    self.booking.cost.gsub(/\D/,'').to_i * 100
  end
  private
    def express_purchase_options
      {
        :ip => ip,
        :token => express_token,
        :payer_id => express_payer_id
      }
    end
end
