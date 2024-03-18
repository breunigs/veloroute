local bicycle = require('bicycle')

function process_way(profile, way, result)
  local name = way:get_value_by_key("name")
  if name
  and way:get_value_by_key("fee") ~= "yes"
  and way:get_value_by_key("amenity") ~= "parking" then
    bicycle.process_way(profile, way, result)
  end
end

function setup()
  local data = bicycle.setup()
  data.oneway_handling = false

  data.access_tag_whitelist = Set {
    'yes',
    'permissive',
    'designated',
    'use_sidepath'
  }

  data.access_tag_blacklist = Set {
    'no',
    'private',
    'forestry',
    'delivery',
    'customers'
  }

  data.service_access_tag_blacklist = Set {
    'customers'
  }

  return data
end

return {
  setup = setup,
  process_way = process_way,
  process_node = bicycle.process_node,
  process_turn = bicycle.process_turn
}
