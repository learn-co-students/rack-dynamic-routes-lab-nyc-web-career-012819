class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      user_item = req.path.split('/items/').last
      item = @@items.find { |item| item.name == user_item}
        if item.nil?
          resp.write "Item not found"
          resp.status = 400
          # if item.name == user_item
        else
          resp.write item.price.to_s
          resp.status = 200
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
