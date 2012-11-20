# The Gambler

Yet another poker hand evaluator. I'm writing it because poker hand evaluators
are useful to me in some of my side projects. If it's useful to you, too, all
the better. If it's not, then don't use it. Easy.

## Usage

Include the gem in your Gemfile:

    gem 'the_gambler'

Start rockin':

    card = Card.new "AH"
    hand = Hand.new "QH", card, %w{10 D}

You can initialize `Card`s using a (case-insensitive) String (_e.g._ `"JC"`), 
an Array (_e.g._ `['9', 'S']`), or a Hash (_e.g._ `{rank: 'Q', suit: :diamonds}`).

## Beta progress

Right now, the following stuff works. Assume anything not mentioned in this list doesn't work properly.

* Blackjack hand evaluation
* (Very) Rough poker hand evaluation (i.e., flush > three of a kind, but not distinguishing between different instances of hands)
* Exact poker hand evaluation of all types of hands (!!!).

### Known issues

* Hands with the same ranking but different high cards are valued equally.

## Contributing to `the_gambler`
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 max thom stahl. See LICENSE.txt for
further details.

