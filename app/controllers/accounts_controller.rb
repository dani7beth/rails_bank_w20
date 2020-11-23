class AccountsController < ApplicationController
  before_action :set_account, only: [:show,:edit,:destroy, :update]
  def index
    @accounts = current_user.accounts
  end

  def show
  end

  def new
    @account = Account.new
  end

  def create
    #one way to create an account does not sanitize
    #current)user.accounts.create(name: praams[:account][:name], balance: params[:account][:balance])
    @account = current_user.accounts.new(account_params)
    if @account.save
      flash[:success] = "Account Created"
      redirect_to accounts_path
    else
      flash[:error] = "Error #{@account.errors.full_messages}"
      render :new
    end
  end

  def edit
  end

  private 
  def set_account
    @account = current_user.accounts.find(params[:id])
  end
  def account_params
    params.require(:account).permit(:name, :balance)
  end
end
