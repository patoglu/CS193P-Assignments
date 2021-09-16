#  Assignments and solutions for [Stanford - Developing Applications for iOS Course 2021](https://cs193p.sites.stanford.edu)

# Assignment 1: Memorize
### Objective
The goal of this assignment is to recreate the demonstration given in the first two lectures and then make some small enhancements. It is important that you understand what you are doing with each step of recreating the demo from lecture so that you are prepared to do those enhancements.


### Required Tasks:
1. Get the Memorize game working as demonstrated in lectures 1 and 2. Type in all the code. Do not copy/paste from anywhere.
2. You can remove the ⊖ and ⊕ buttons at the bottom of the screen.
3. Add a title “Memorize!” to the top of the screen.
4. Add at least 3 “theme choosing” buttons to your UI, each of which causes all of the cards to be replaced with new cards that contain emoji that match the chosen theme. You can use Vehicles from lecture as one of the 3 themes if you want to, but you are welcome to create 3 (or more) completely new themes.
5. The number of cards in each of your 3 themes should be different, but in no case fewer than 8.
6. The cards that appear when a theme button is touched should be in an unpredictable (i.e. random) order. In other words, the cards should be shuffled each time a theme button is chosen.
7. The theme-choosing buttons must include an image representing the theme and text describing the theme stacked on top of each other vertically.
8. The image portion of each of the theme-choosing buttons must be created using an SF Symbol which evokes the idea of the theme it chooses (like the car symbol and the Vehicles theme shown in the Screenshot section below).
9. The text description of the theme-choosing buttons must use a noticeably smaller font than the font we chose for the emoji on the cards.
10. Your UI should work in portrait or landscape on any iPhone. This probably will not require any work on your part (that’s part of the power of SwiftUI), but be sure to experiment with running on different simulators in Xcode to be sure.

### Working demo :grinning:
<p align="center">
  <img src="https://media.giphy.com/media/QG7NF1GJ3tHzcB9FOl/giphy.gif?cid=790b76112a3c8f3f2d257c69ce01386bfdee628995967c95&rid=giphy.gif&ct=g" alt="animated"/>
  <img src="https://media.giphy.com/media/hiRcJctmVniT8wsLJq/giphy.gif?cid=790b7611fb6faf194d8d07c06757f2b64f2017f2242202c8&rid=giphy.gif&ct=g" alt="animated" />
</p>

# Assignment 2: More Memorize
### Objective
The goal of this assignment is to continue to recreate the demonstrations given in the first four lectures and then make some bigger enhancements. It is important that you understand what you are doing with each step of recreating the demo from lecture so that you are prepared to do those enhancements.

### Required Tasks:

1. Get the Memorize game working as demonstrated in lectures 1 through 4. Type in all the code. Do not copy/paste from anywhere.
2. If you’re starting with your assignment 1 code, remove your theme-choosing buttons and (optionally) the title of your game.
3. Add the formal concept of a “Theme” to your Model. A Theme consists of a name for the theme, a set of emoji to use, a number of pairs of cards to show, and an appropriate color to use to draw the cards.
4. At least one Theme in your game should show fewer pairs of cards than the number of emoji available in that theme.
5. If the number of pairs of emoji to show in a Theme is fewer than the number of emojis that are available in that theme, then it should not just always use the first few emoji in the theme. It must use any of the emoji in the theme. In other words, do not have any “dead emoji” in your code that can never appear in a game.
6. Never allow more than one pair of cards in a game to have the same emoji on it.
7. If a Theme mistakenly specifies to show more pairs of cards than there are emoji available, then automatically reduce the count of cards to show to match the count of available emoji.
8. Support at least 6 different themes in your game.
9. A new theme should be able to be added to your game with a single line of code.
10. Add a “New Game” button to your UI (anywhere you think is best) which begins a brand new game.
11. A new game should use a randomly chosen theme and touching the New Game button should repeatedly keep choosing a new random theme.
12. The cards in a new game should all start face down.
13. The cards in a new game should be fully shuffled. This means that they are not in any predictable order, that they are selected from any of the emojis in the theme (i.e. Required Task 5), and also that the matching pairs are not all side-by-side like they were in lecture (though they can accidentally still appear side-by-side at random).
14. Show the theme’s name in your UI. You can do this in whatever way you think looks best.
15. Keep score in your game by penalizing 1 point for every previously seen card that is involved in a mismatch and giving 2 points for every match (whether or not the cards involved have been “previously seen”). See Hints below for a more detailed explanation. The score is allowed to be negative if the user is bad at Memorize.
16. Display the score in your UI. You can do this in whatever way you think looks best.

### Known Bugs:
If the last pairs of emojis match they don't disappear from the UI. I didn't fix it because I think the course instructor left this bug intentionally to fix in future lessons.

### Working demo :sweat_smile:

<p align="center">
  <img src="https://media.giphy.com/media/aTTbdmtp5lhYVttJI5/giphy.gif?cid=790b7611cd03ce1da532b002acf43dc5762bdda8b8845e18&rid=giphy.gif&ct=g" alt="animated"/>
  <img src="https://media.giphy.com/media/JaB83jLokFAabMjwC5/giphy.gif?cid=790b76115580e39e415de003890a897c0940647f632ca019&rid=giphy.gif&ct=g" alt="animated" />
  <img src="https://media.giphy.com/media/Y47jsl1hBqq79g2EJv/giphy.gif?cid=790b7611bbc09b7cf198c8848b16480729a8ea8775e0ca9b&rid=giphy.gif&ct=g" alt="animated" />
</p>
