Takeaway Challenge
==================
```
                           _________
             r==           |       |
          _  //            |  R.G. |   ))))
         |_)//(''''':      |       |
           //  \_____:_____.-------D     )))))
          //   | ===  |   /        \
      .:'//.   \ \=|   \ /  .:'':./    )))))
     :' // ':   \ \ ''..'--:'-.. ':
     '. '' .'    \:.....:--'.-'' .'
      ':..:'                ':..:'
 
```
 
## Getting Started
 
### Setup
From the command line run the following:
```
git@github.com:beca-g/takeaway-challenge-revisited.git
cd takeaway-challenge-revisited
```
### Install dependencies
```
bundle
```
### To run tests
```
rspec
```
 
Task & Requirments
-----
 
* Write a Takeaway program with the following user stories:
 
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices
```
```
As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes
```
```
As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order
```
```
As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```
 
* Hints on functionality to implement:
 * Ensure you have a list of dishes with prices
 * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise, the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
 * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
 * Use the twilio-ruby gem to access the API
 * Use the Gemfile to manage your gems
 * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
 * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
 * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.
 
# My Approach
 
I had a test-driven and OOP approach to this challenge, firstly carrying out a plan for the classes and structure.
 
## Planning
 
- I planned the basic structure of the code by breaking down the user stories into classes and methods by extracting the nouns and verbs. For readability and to simplify the code as much as possible I decided to have four classes: Takeaway, Menu, Order and SMS.
 
 
| Class    | Attributes                    | Methods                                                            |
|----------|-------------------------------|--------------------------------------------------------------------|
| Takeaway | - @menu<br>- @order<br>- @sms | - view_menu<br>- add_dish(dishes)<br>- place_order(dishes)         |
| Menu     | - @dishes                     | - print<br>- has_dish<br>- price(dish)                             |
| Order    | - @menu<br>- @dishes = { }                | - add(dish, quantity)<br>- delete(dish)<br>- view_order<br>- total |
| SMS      |                               | - send_sms<br>- deliver_time                              |
 
- I then diagrammed and predicted how the classes and methods would work together.
 
![Imgur](https://imgur.com/AJ77ZgW.png)
 
## Test Coverage
![Imgur](https://imgur.com/WqBE0Il.png)

## Tech

- ruby 2.7.0
- rspec
- rubocop
- simple-cov
- twilio-ruby