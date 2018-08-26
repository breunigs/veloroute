def only_if_current_route(route, code)
  name = route.is_a?(String) ? route : route.name
  <<~CODE
    <% if(htmlWebpackPlugin.options.filename == "#{name}.html") { %>
      #{code}
    <% } %>
  CODE
end
