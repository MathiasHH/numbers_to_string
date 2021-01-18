# NumbersToString

**Øv: Jeg nåede desværre ikke Docker. Så Elixir og Erlang skal installeres.**

## Installation

[Install Elixir og Erlang](https://elixir-lang.org/install.html), Fx på Mac OS og Ubuntu:

Mac OS: 
* brew update && brew install elixir. 

Ubuntu: 
* Add Erlang Solutions repository: wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
* Run: sudo apt-get update
* Install the Erlang/OTP platform and all of its applications: sudo apt-get install esl-erlang
* Install Elixir: sudo apt-get install elixir
 

## Hent afhængigheder og kompiler projektet:
mix do deps.get, deps.compile, compile

## Start serveren
mix run --no-halt


## Test app 

Kør unit test fra bash eller anden shell: mix test

åben http://localhost:4000/numbers_to_string?1 i en browser eller brug cURL, POSTMAN eller anden klient.

Benyt forskellige querystrings for at teste forskellige tal.

Fx:

http://localhost:4000/numbers_to_string?147.5

http://localhost:4000/numbers_to_string?4000.0

Osv.
