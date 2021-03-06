Spree::Core::Engine.routes.append do
  namespace :admin do
    scope :barcode do
      get "/print/:id" => "barcode#print"
      get "/code/:id" => "barcode#code"
      post "/stickers/" => "barcode#stickers"
    end

    get 'print_coupon/:coupon_code' => 'print_coupon#print'
    
    scope :pos do
      get "/new" => "pos#new"
      get "/show/:number" => "pos#show"
      post "/apply_coupon/:number" => "pos#apply_coupon"
      post "/show/:number" => "pos#show"
      get "/find/:number" => "pos#find"
      get "/add/:number/:item" => "pos#add"
      get "/remove/:number/:item" => "pos#remove"
      post "/print/:number" => "pos#print"
      get "/print/:number" => "pos#print"
      get "/payment/:number" => "pos#payment"
      get "/inventory/:number" => "pos#inventory"
      get "/report" => "pos#report"

      scope :refund do
        get 'select_order' => 'refund#select_order'
        post 'select_items' => 'refund#select_items'
        post 'create_refund' => 'refund#create_refund'
        get 'select_coupon' => 'refund#select_coupon'
        post 'create_coupon' => 'refund#create_coupon'
      end
    end

    get "/pos" , :to => "pos#new"
  end
end

