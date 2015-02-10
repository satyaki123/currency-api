class ApiController < ApplicationController
  require 'money'
  require 'money/bank/google_currency'
  def convert
    bank = Money::Bank::GoogleCurrency.new
    from_currency = params[:from_currency]
    to_currency = params[:to_currency]
    render :json => {:success => false} and return if from_currency.blank? || to_currency.blank?
    begin
    rate = bank.get_rate(from_currency, to_currency).to_f
    render :json => {:success => true,:rate => rate} 
    rescue Exception => e
      render :json => {:success => false} 
    end
    
  end
end
