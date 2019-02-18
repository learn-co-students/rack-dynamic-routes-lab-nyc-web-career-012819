class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_search = req.path.split("/items/").last
      validate = @@items.find {|item| item.name == item_search}
      if validate
        resp.write validate.price
        resp.status = 200
      else
      resp.write "Item not found"
      resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
