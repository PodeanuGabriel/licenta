class CouponsController < ApplicationController
  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.find(:all,
                           :joins => "JOIN companies on companies.id = coupons.company_id
                                      JOIN users on companies.owner_id = users.id",
                           :select => " coupons.id,coupons.preview_image,coupons.showcase_image,coupons.title,coupons.description,
                                        coupons.latitude,coupons.longitude,coupons.phone,coupons.company_id,coupons.website,
                                        coupons.redeem_schedule,coupons.begin_date,coupons.end_date,coupons.redeem_code,
                                        coupons.number_of_coupons,coupons.category_id,coupons.price_without_coupon,coupons.price_with_coupon",
                           :conditions => "users.email = '#{ current_user }'" )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coupons }
    end
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coupon }
    end
  end

  # GET /coupons/new
  # GET /coupons/new.json
  def new
    @coupon = Coupon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coupon }
    end
  end

  # GET /coupons/1/edit
  def edit
    @coupon = Coupon.find(params[:id])
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(params[:coupon])

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render json: @coupon, status: :created, location: @coupon }
      else
        format.html { render action: "new" }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coupons/1
  # PUT /coupons/1.json
  def update
    @coupon = Coupon.find(params[:id])

    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy

    respond_to do |format|
      format.html { redirect_to coupons_url }
      format.json { head :no_content }
    end
  end

  def get_coupons
    
    @all_coupons = Coupon.find(:all,
                               :select => "id, category_id, preview_image, title, description,
                                           ( 6371 * acos( cos( radians( #{params[:latit]} ) ) * cos( radians( latitude ) ) *
                                                          cos( radians( longitude )           - radians( #{params[:longit]} ) ) +
                                                          sin( radians( #{params[:latit]} ) ) * sin( radians( latitude ) )
                                                        )
                                           ) as distance",
                               :conditions => " #{ params[:distance] } >= ( 6371 * acos( cos( radians( #{params[:latit]} ) ) * cos( radians( latitude ) ) *
                                                                                        cos( radians( longitude )           - radians( #{params[:longit]} ) ) +
                                                                                        sin( radians( #{params[:latit]} ) ) * sin( radians( latitude ) )
                                                                                      )
                                                                         ) and ( end_date - current_date > 0 ",
                               :order => "distance asc"
                              )

    respond_to do |format|
      format.html { render json: @all_coupons.to_json , :content_type => 'application/json' }
      if params[:callback]
        format.js { render json: @all_coupons.to_json , :callback => params[:callback] , :content_type => 'application/json' }
      else
        format.js { render json: @all_coupons.to_json , :content_type => 'application/json' }
      end
    end

  end

  def get_coupon_details
    @all_coupons = Coupon.find(:all,
                               :joins => " JOIN companies on companies.id = coupons.company_id",
                               :select => "coupons.id, coupons.showcase_image, coupons.category_id, coupons.title,
                                           coupons.description, coupons.price_without_coupon,coupons.price_with_coupon,
                                           coupons.phone, coupons.website, coupons.redeem_schedule, coupons.redeem_code,
                                           coupons.end_date, companies.name,
                                           ( 
                                             select count(coupon_id)
                                             from transactions
                                             where coupon_id = #{params[:id]}
                                               and user_id = '#{params[:device_id]}'
                                           ) as bought,
                                           (
                                             select favorite
                                             from transactions
                                             where coupon_id = #{params[:id]}
                                               and user_id = '#{params[:device_id]}'
                                           ) as favorite",
                               :conditions => " coupons.id = #{ params[:id] } "
                              )

    respond_to do |format|
      format.html { render json: @all_coupons.to_json , :content_type => 'application/json' }
      if params[:callback]
        format.js { render json: @all_coupons.to_json , :callback => params[:callback] , :content_type => 'application/json' }
      else
        format.js { render json: @all_coupons.to_json , :content_type => 'application/json' }
      end
    end
    
  end

  def get_map_coupon_details
    @all_coupons = Coupon.find(:all,
                               :joins => " JOIN companies on companies.id = coupons.company_id
                                           JOIN categories on coupons.category_id = categories.id",
                               :select => "coupons.id, coupons.title, coupons.description, coupons.price_with_coupon,
                                           coupons.latitude, coupons.longitude, coupons.preview_image,
                                           companies.logo, categories.category_image"
                              )

    respond_to do |format|
      format.html { render json: @all_coupons.to_json , :content_type => 'application/json' }
      if params[:callback]
        format.js { render json: @all_coupons.to_json , :callback => params[:callback] , :content_type => 'application/json' }
      else
        format.js { render json: @all_coupons.to_json , :content_type => 'application/json' }
      end
    end

  end

end
