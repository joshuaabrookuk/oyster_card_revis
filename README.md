# oyster_card_revis

First User story

In order to use public transport
As a customer
I want money on my card


oystercard = Oystercard.new
oystercard.balance
=> 0


In order to keep using public transport
As a customer
I want to add money to my card

oystercard = Oystercard.new
oystercard.top_up(20)
oystercard.balance
=> 20

In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card


oystercard = Oystercard.new
oystercard.top_up(91)
oystercard.balance
=> Error Raised /// maximum top up ammount is £90


In order to pay for my journey
As a customer
I need my fare deducted from my card

oystercard = Oystercard.new
oystercard.top_up(20)
oystercard.deduct(5)
oystercard.balance
=> 15


In order to get through the barriers.
As a customer
I need to touch in and out.


oyster_card.top_up(20)
oystercard.touch_in
oystercard.in_journey
=> true
oystercard.touch_out
oystercard.in_journey
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
oystercard.touch_in
oystercard.touch_out
oyster_card.balance
# => (@balance - MININUM_FARE) /// (we haven't been told to give this a value)
# but i will give it 1
=> 19


In order to pay for my journey
As a customer
I need to know where I've travelled from


oyster_card.top_up(20)
oystercard.touch_in('Waterloo')
oystercard.entry_station
=> 'Waterloo'
oyster_card.touch_out
oystercard.entry_station
=> nil


irb testing

require './lib/oyster_card'
oyster_card = Oystercard.new
oyster_card.balance
oyster_card.top_up(20)
oyster_card.balance
oyster_card.deduct(5)
oyster_card.balance
oyster_card.touch_in('Waterloo')
oystercard.entry_station
oyster_card.in_journey
oyster_card.touch_out
oystercard.entry_station
oyster_card.balance
