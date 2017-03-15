## Battleship Coding Challenge

For this coding challenge you'll build a simplified version of [battleship](https://en.wikipedia.org/wiki/Battleship_(game)). You'll have 3 ships that will be placed on a 10 by 10 grid which is the battleground. Each cell in the battleground is identified by its space on an x,y axis with [0,0] being the cell in the bottom left corner. Each ship is 1 cell wide and 3 cells long. On initial placement, each ship is oriented vertically. Ships may not overlap each other. To initialize the playing field you'll receive a 2 dimensional array where each element in the array contains the x,y coordinates of each ship's topmost cell. So for example, if you receive this array [[0,3],[4,8],[6,6]] then your initial playing board will have ships that occupy the following cells:

`[[0,3],[0,2],[0,1]]`, `[[4,8],[4,7],[4,6]]` and `[[6,6],[6,5],[6,4]]`

Your game interface will be a basic HTTP API. You should assume that you are implementing a spec that has already been published to clients and they will use the spec to learn how to interact with the game.

We want you to flesh out the provided `BattleshipsController` so that the `create` action accepts a 2-dimensional array (represented as a string) that contains the topmost cell coordinates of ships to initialize the playing board.

### Acceptance Criteria

Once you implement the `create` action you’ll then need to complete the `update` action to take x and y parameters and return the following responses under the given conditions:

| Response | Condition |
| --- | --- |
| miss | When the coordinate does not land on a ship. |
| hit | When the coordinate lands on a ship and the ship is not yet sunk. Multiple attacks on the same spot should return as hit unless the ship is already sunk. |
| sunk | When the ship has been hit on all 3 of its cells. Subsequent attacks on a sunk ship should continue to return a sunk response. |

All responses should be lowercase letters only. We will evaluate your submission in two stages:

1. **Correctness** - When you submit your solution, we will run it through a suite of automated tests to verify the above acceptance criteria are satisfied. 
2. **Code quality** - If your solution satisfies the correctness check, then it will be evaluated by a pair of engineers for code quality. For more details see the [What we're looking for](#what-were-looking-for) section.

### Getting Started

1. This problem was built and tested with Ruby version 2.3.3
2. You should have received an email with a repo url. Clone this repo
3. `cd` into your local directory copy
4. `gem install bundler`
5. `bundle install`

### Inputs and Outputs

All inputs and outputs are strings i.e. when running against a local server the following sequence of commands should result in the `PUT` call returning a string response that reads `hit`:

`curl --data "positions=[[0,3], [4,8], [6,6]]" http://localhost:3000/battleship`

`curl -X PUT -d x=0 -d y=1 -s http://localhost:3000/battleship`

### Other Notes

To make things easier (and remove the need for persistent storage) the development and test environments have been modified to enable class caching. A memory store cache is also available. Feel free to use a class variable, cache or something else to maintain state between subsequent HTTP API calls. You can assume that only one agent is accessing the API.

Q. _Say what?! You're suggesting we could use a class variable in a controller. Isn't that frowned upon?_

A. We agree with you and in our production code we avoid maintaining state in the controller. However, if design decisions should be made in context, then we think it's ok to use a class variable for this exercise. We're more interested in other aspects of your solution. You don't have to use a class variable (some people do, and some people don't). We promise not to judge you for using a class variable if you don't judge us too harshly for having a problem that encourages it.


## What we're looking for

We want you to submit a solution you're proud of and we want you to be successful so here are some of the things we're looking for in a solution:

* A solution that is correct for various input values. We're big fans of writing tests to help us build quality software.
* A solution that shows good object oriented (or functional) programming principles but doesn't go overboard.
* A solution that shows familiarity with the language used.
