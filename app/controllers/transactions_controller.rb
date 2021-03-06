class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.json
  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(params[:transaction])

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.json
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  def claim_coupon

     @check = Transaction.where( :user_id=> params[:device_id] , :coupon_id => params[:coupon_id] )

     @number = Coupon.find( :all, :select => "number_of_coupons", :conditions => "id = #{params[:coupon_id]}")

     if( (@number.to_json).to_i > 0 && @check.blank? )

      @buy_coupon = Transaction.new( :user_id => params[:device_id].gsub(/[']/,'') ,
                                     :coupon_id => params[:coupon_id],
                                     :quantity => 1,
                                     :buy_date => Time.now,
                                     :savings => params[:savings]
                                   )
      @buy_coupon.save

      @update = Coupon.find(params[:coupon_id])
      @update.number_of_coupons = @update.number_of_coupons - 1
      @update.save

     elsif( (@number.to_json).to_i <= 0 )

      @check = "Coupon Sold Out"

     end

     respond_to do |format|
      format.html { render json: @check.to_json , :content_type => 'application/json' }
      if params[:callback]
        format.js { render json: @check.to_json , :callback => params[:callback] , :content_type => 'application/json' }
      else
        format.js { render json: @check.to_json , :content_type => 'application/json' }
      end
     end

  end

  def favorite_coupon

     Transaction.update_all( "favorite = 1", "user_id = '#{params[:device_id]}' and coupon_id = #{params[:coupon_id]}" )

     @check = Transaction.find( :all , :conditions => "user_id = '#{params[:device_id]}' and coupon_id = #{params[:coupon_id]}" )
    
    respond_to do |format|
      format.html { render json: @check.to_json , :content_type => 'application/json' }
      if params[:callback]
        format.js { render json: @check.to_json , :callback => params[:callback] , :content_type => 'application/json' }
      else
        format.js { render json: @check.to_json , :content_type => 'application/json' }
      end
    end

  end

  def favorite_remove
    
    Transaction.update_all( "favorite = 0", "user_id = '#{params[:device_id]}' and coupon_id = #{params[:coupon_id]}" )

    @check = Transaction.find( :all , :conditions => "user_id = '#{params[:device_id]}' and coupon_id = #{params[:coupon_id]}" )

    respond_to do |format|
      format.html { render json: @check.to_json , :content_type => 'application/json' }
      if params[:callback]
        format.js { render json: @check.to_json , :callback => params[:callback] , :content_type => 'application/json' }
      else
        format.js { render json: @check.to_json , :content_type => 'application/json' }
      end
    end
  end

  def savings_show

    @claimed = Transaction.find( :all,
                                 :joins => "JOIN coupons on transactions.coupon_id = coupons.id",
                                 :select => " coupons.id, coupons.preview_image, coupons.title,
                                              coupons.description, transactions.savings " ,
                                 :conditions => " user_id = '#{params[:device_id]}' " )

    respond_to do |format|
      format.html { render json: @claimed.to_json , :content_type => 'application/json' }
      if params[:callback]
        format.js { render json: @claimed.to_json , :callback => params[:callback] , :content_type => 'application/json' }
      else
        format.js { render json: @claimed.to_json , :content_type => 'application/json' }
      end
    end
    
  end

  def favorites_show

    @favorite = Transaction.find( :all,
                                  :joins => "JOIN coupons on transactions.coupon_id = coupons.id",
                                  :select => " coupons.id, coupons.preview_image, coupons.title,
                                               coupons.description, transactions.savings " ,
                                  :conditions => " user_id = '#{params[:device_id]}' and favorite = 1" )

    respond_to do |format|
      format.html { render json: @favorite.to_json , :content_type => 'application/json' }
      if params[:callback]
        format.js { render json: @favorite.to_json , :callback => params[:callback] , :content_type => 'application/json' }
      else
        format.js { render json: @favorite.to_json , :content_type => 'application/json' }
      end
    end
  end

end
