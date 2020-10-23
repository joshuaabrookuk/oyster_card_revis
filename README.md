# oyster_card_revis

First User story

In order to use public transport
As a customer
I want money on my card


oyster_card = Oystercard.new
oyster_card.balance
=> 0


In order to keep using public transport
As a customer
I want to add money to my card

oyster_card = Oystercard.new
oyster_card.top_up(20)
oyster_card.balance
=> 20

In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card


oyster_card = Oystercard.new
oyster_card.top_up(91)
oyster_card.balance
=> Error Raised /// maximum top up ammount is £90


In order to pay for my journey
As a customer
I need my fare deducted from my card

oyster_card = Oystercard.new
oyster_card.top_up(20)
oyster_card.deduct(5)
oyster_card.balance
=> 15


In order to get through the barriers.
As a customer
I need to touch in and out.


oyster_card.top_up(20)
oyster_card.touch_in
oyster_card.in_journey
=> true
oyster_card.touch_out
oyster_card.in_journey
=> fasle


In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.


oyster_card.balance
=> 0
oyster_card.touch_in
=> Error Raised /// minimum balance is £1 to enter


In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card


oyster_card.top_up(20)
oyster_card.balance
=> 20
oyster_card.touch_in
oyster_card.touch_out
oyster_card.balance
# => (@balance - MININUM_FARE) /// (we haven't been told to give this a value)
# but i will give it 1
=> 19


In order to pay for my journey
As a customer
I need to know where I've travelled from


oyster_card.top_up(20)
oyster_card.touch_in('Waterloo')
oyster_card.entry_station
=> 'Waterloo'
oyster_card.touch_out
oyster_card.entry_station
=> nil


In order to know where I have been
As a customer
I want to see all my previous trips


oyster_card.top_up(20)
oyster_card.touch_in('Waterloo')
oyster_card.touch_out('Bank')
oyster_card.journeys
=> [{:entry_station=>"Waterloo", :exit_station=>"Bank"}]


In order to know how far I have travelled
As a customer
I want to know what zone a station is in


station = Station.new
station.name
=> 'Waterloo'
station.zone
=> 1

irb testing oyster_card

require './lib/oyster_card'
oyster_card = Oystercard.new
oyster_card.balance
oyster_card.top_up(20)
oyster_card.balance
oyster_card.touch_in('Waterloo')
oyster_card.entry_station
oyster_card.touch_out('Bank')
oyster_card.journeys

irb testing oyster_card

require './lib/station'
station = Station.new
station.name
station.zone
