#Cardboard README

## What is Cardboard?
**Cardboard is a meetup facilitator, records logger and visualizer, and social platform for board game enthusiasts.**

Boardgames have been quietly resurging for a decade or more.  The Monopolies and Scrabbles of yesteryears are being replaced by new generations of complex strategic board games that do not tire even after hundreds of play. We live in a time when most social interactions involve a screen, but people still crave the thought-provoking real-life interaction that boardgames provide.

Cardboard is an application that helps stave off the the madness and wasted time that comes with from administrivia of organizing board game meetups. Whether it’s a weekly boardgame meetup for the hardcore or a monthly dinner and boardgame night for a group of friends, Cardboard helps us maximize our time gaming together and enjoying company.

## Vitals
Ruby: 2.1.3p242,
Rails: 4.1.8,
ChartJS, 1.0.2
jQuery 2.1.3,
Bootstrap 3.3.4,

##Setup
```
rake db:create db:migrate db:seed
```
Seeding is optional. Will take approximately 20 minutes. Not strictly necessary but will greatly increase the speed at which large external boardgame collections are imported


## Run tests
**Rspec**
```
rspec <file path>
```
**Jasmine  (upcoming)**
http://localhost:3000/specs

## A Final Word
Thanks for taking a look at Cardboard. I filly will continue development on this project and would gladly welcome any issues being opened and helpful pull request. Also, if you have any suggestions code related or otherwise feel free to contact me at bdjohnso8@gmail.com. Thanks!
