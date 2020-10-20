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


irb testing

require './lib/oyster_card'
oyster_card = Oystercard.new
oyster_card.top_up()
