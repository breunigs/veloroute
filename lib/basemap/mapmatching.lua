local bicycle = require('bicycle')
-- allow "push bike" paths for naming, even if bicycle=no
local allowed_despite_bicycle_no = Set { 'path', 'pedestrian', 'service' }

function process_way(profile, way, result)
  local name = way:get_value_by_key("name") or way:get_value_by_key("bridge:name")
  if name
  and way:get_value_by_key("fee") ~= "yes"
  and way:get_value_by_key("amenity") ~= "parking"
  and (
    way:get_value_by_key("bicycle") ~= "no"
    or
    allowed_despite_bicycle_no[way:get_value_by_key("highway")]
    or
    -- some ways are tagged bicycle=no cycleway=track, which makes no sense tag
    -- wise. Probably an edit error.
    way:get_value_by_key("cycleway") ~= ""
  ) then
    result.name = name
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
    -- allow "push bike" paths for naming, even if bicycle=no
    -- 'no',
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
