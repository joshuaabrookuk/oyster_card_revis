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
