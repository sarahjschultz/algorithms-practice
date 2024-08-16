def locations_for_fulfillment(order)
  inventory = {
    Vancouver: {
      J: 10,
      H: 2,
      S: 6
    },
    Toronto:   {
      J: 5,
      H: 0,
      S: 0
    },
    Montreal:  {
      J: 3,
      H: 5,
      S: 5
    },
    Calgary:   {
      J: 1,
      H: 18,
      S: 2
    },
    Halifax:   {
      J: 28,
      H: 2,
      S: 12
    }
  }

  stores = inventory.select do |_location, store_inventory|
    store_inventory.all? do |name, sauce_count|
      sauce_count >= order[name]
    end
  end

  stores.keys
end

# order = { J: 3, H: 2, S: 4 } # V, M, H
order = { J: 0, H: 7, S: 1 } # C
locations_for_fulfillment(order)
