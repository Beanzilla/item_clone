-- Test file for the API
minetest.log("action", "[item_replicator] Test: ....")

-- Get the original settings
local old_settings = {}
old_settings.log_api = item_replicator_settings.log_api
old_settings.log_production = item_replicator_settings.log_production
old_settings.allow_unknown = item_replicator_settings.allow_unknown
old_settings.unknown_item_amount = item_replicator_settings.unknown_item_amount
old_settings.unknown_item_time = item_replicator_settings.unknown_item_time

-- Set the stuff to a good known value
item_replicator_settings.log_api = true
item_replicator_settings.log_production = true
item_replicator_settings.allow_unknown = false
item_replicator_settings.unknown_item_amount = 1
item_replicator_settings.unknown_item_time = 30

-- Test adding an item (Insert and Update check
item_replicator.add("default:dirt", 2, 5)
item_replicator.add("default:dirt", 4, 10)
item_replicator.add("default:dirt", 2, 15)

-- Test validity
if item_replicator.is("default:dirt_with_grass") then
    item_replicator_internal.throw_error("item_replicator.is('default:dirt_with_grass') ~= false")
end
if not item_replicator.is("default:dirt") then
    item_replicator_internal.throw_error("item_replicator.is('default:dirt') ~= true")
end

-- Test amounts
if item_replicator.get_amount("default:dirt_with_grass") ~= -1 then
    item_replicator_internal.throw_error("item_replicator.get_amount('default:dirt_with_grass') ~= -1")
end
if item_replicator.get_amount("default:dirt") ~= 2 then
    item_replicator_internal.throw_error("item_replicator.get_amount('default:dirt') ~= 2")
end

-- Test times
if item_replicator.get_time("default:dirt_with_grass") ~= -1 then
    item_replicator_internal.throw_error("item_replicator.get_time('default:dirt_with_grass') ~= -1")
end
if item_replicator.get_time("default:dirt") ~= 15 then
    item_replicator_internal.throw_error("item_replicator.get_time('default:dirt') ~= 15")
end

-- Test Cleanup (Also a test against removals)
item_replicator.remove("default:dirt")
if item_replicator.is("default:dirt") then
    item_replicator_internal.throw_error("item_replicator.remove('defualt:dirt') did not remove!")
end

-- Restore settings
item_replicator_settings.log_api = old_settings.log_api
item_replicator_settings.log_production = old_settings.log_production
item_replicator_settings.allow_unknown = old_settings.allow_unknown
item_replicator_settings.unknown_item_amount = old_settings.unknown_item_amount
item_replicator_settings.unknown_item_time = old_settings.unknown_item_time

-- If the user wants to... just have them exit
if item_replicator_settings["exit_after_test"] then
    minetest.log("action", "[item_replicator] Test: OKAY")
    error("[item_replicator] Test: OKAY  (Your seeing this because exit_after_test is true)")
end

-- The user chosen to keep running... so let's just let them know the tests passed
minetest.log("action", "[item_replicator] Test: OKAY")