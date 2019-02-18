class Application

@@items

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_search = req.path.split("/items/").last
      item_name = @@items.find {|it| it.name == item_search}
        if item_name
          resp.write "#{item_name.price}"
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
