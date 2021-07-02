class Api::V1::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    render json: @customers
  end

  def create
    @customer = Customer.create(customer_params)
    if @customer.valid?
      render json: @customer
    else
      render json: @customer.errors, status: 422
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    render status: 204
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :age, :phone_number)
  end
end

