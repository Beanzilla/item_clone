
-- Settings
item_replicator_settings = {}

-- Do we log the api calls? (Great for debugging issues but not so good on a long running production server)
item_replicator_settings.log_api = true

-- Do we log that items were produced? (Great for debugging issues but not so good on a long running production server)
item_replicator_settings.log_production = true

-- Testing the API (Turn these false when not testing)
item_replicator_settings.run_test = true
item_replicator_settings.exit_after_test = false

-- If an item is not in the known items list it will equal this value
item_replicator_settings.allow_unknown = true
item_replicator_settings.unknown_item_time = 30
item_replicator_settings.unknown_item_amount = 1

-- Is the Replicator craftable?
item_replicator_settings.craft = true