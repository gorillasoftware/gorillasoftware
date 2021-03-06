---
title: Birom Dilemma I
updated_at: 2011-06-29
tags: birom, problem solving
---

![Birom Dilemma starts at move 5](/blog/2011-06-29-Birom-Dilemma-I/teaser.jpg)
<small>A fork in the road in North Georgia<a href="http://www.flickr.com/photos/nshivar/9648409425/">↩</a></small>


While implementing integration tests for our new [birom](http://birom.net) library I
encountered a pattern where the implementation did not entirely match the rules
described [here](http://birom.net/424843/Rules). READMORE

The pattern in question was _Fig. 6b_. I tried to replay the game and
found the following sequence of moves:

![Birom Dilemma starts at move 5](/blog/2011-06-29-Birom-Dilemma-I/dilemma.jpg)

For the remainder, player A holds the blue, player B the yellow stones.
Moves __(1)__ to __(4)__ are non-ambiguous. The order is clear and
the shown sequence of stones is the only valid I've found.

With move __(5)__ now, player A creates common
ground by enclosing a vacant area with his own blue stones (green area).
At the same time, this allows the yellow stones to encircle the blue
stone __(1)__. In move __(6)__, the blue stone __(1)__ is still in it's
place and subject to be captured by the yellow stone in move __(6)__.

The main question that arises is if a move made by player A can capture
current player's stones by enabling his opponent to encircle his own stones
via common ground in the current move. It's not a question of state but
rather a question of sequence. Is stone __(1)__ captured in move __(5)__
or __(6)__?

Put differently, is stone __(1)__ still captured by yellow if player
B decides to put the yellow stone of move __(6)__ somewhere else?

__Update (June 30 2011)__: As it turned out, the pattern on the picture is
invalid. The blue stone __(1)__ is encircled when move __(5)__ is
completed. Blue allows yellow with turn __(5)__ to encircle __(1)__.
Therefore, the blue stone can be removed from the field and be
re-used by player B as an additional yellow stone.

