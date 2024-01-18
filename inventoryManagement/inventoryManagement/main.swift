//
//  main.swift
//  inventoryManagement
//
//  Created by StudentAM on 1/16/24.
//

import Foundation

//Title
print("Welcome To the Inventory Management System.")

//Items in stock stored in different variables (starting values)
var storeCereal: Int = 50
var storeMilk: Int = 100
var storeSyrup: Int = 40
var storeCup: Int = 200

//Cart Items Stored In different variables
var userMilk: Int = 0
var userCereal: Int = 0
var userSyrup: Int = 0
var userCup: Int = 0

//Initializing User Choice Variable
var shop: Bool = true

//function that returns a double of the user's current total
func currentTotal() -> Double{
    var total: Double = (Double(userMilk)*4.99) + (Double(userCup)*2.99) + (Double(userCereal)*3.99) + (Double(userSyrup)*3.99)
    return round(total * 100)/100
}

//function that checks if there are enough items in stock for the user to get
func inStock(_ itemNum:String, _ quantity:Int) -> Bool{
    if itemNum == "1"{
        if quantity > storeCereal{
            return false
        }
    }
    else if itemNum == "2"{
        if quantity > storeMilk{
            return false
        }
    }
    else if itemNum == "3"{
        if quantity > storeSyrup{
            return false
        }
    }
    else{
        if quantity > storeCup{
            return false
        }
    }
    return true
}

//function that checks if there are enough items in the user's cart to remove
func inCart(_ itemNum:String, _ quantity:Int) -> Bool{
    if itemNum == "1"{
        if quantity > userCereal{
            return false
        }
    }
    else if itemNum == "2"{
        if quantity > userMilk{
            return false
        }
    }
    else if itemNum == "3"{
        if quantity > userSyrup{
            return false
        }
    }
    else{
        if quantity > userCup{
            return false
        }
    }
    return true
}

//Main function (Displayed)
while shop{
    //Main Menu
    print("How can we help you today? (Enter Number of Selection)")
    print("1. Add Item To Cart")
    print("2. Remove Item From Cart")
    print("3. Check Item Availability In Stock")
    print("4. Access Admin Menu")
    print("5. Checkout")
    
    //reading the user's answer
    if let choice = readLine(){
        
        //if the user chooses to add items to cart
        if choice == "1"{
            print("What would you like to add to cart? (Enter Number of Selection)")
            print("1. Cereal")
            print("2. Milk")
            print("3. Syrup")
            print("4. Cups")

            if let itemToAdd = readLine(){
                //adding cereal
                if itemToAdd == "1"{
                    print("How many cereal(s) would you like to add to your cart?")
                    if let numItem = readLine(){
                        if let quan = Int(numItem){
                            if inStock(itemToAdd, quan){
                                userCereal += quan
                                storeCereal -= quan
                                print("You have added \(quan) cereal(s) to your cart!")
                            }
                            //if the user wants to add more cereals than what is in stock to their cart
                            else{
                                print("Sorry, there are only \(storeCereal) cereal(s) in stock. You are unable to add \(quan) cereal(s) to your cart.")
                            }
                        }
                    }
                    
                }
                //adding milks
                else if itemToAdd == "2"{
                    print("How many milk(s) would you like to add to your cart?")
                    if let numItem = readLine(){
                        if let quan = Int(numItem){
                            if inStock(itemToAdd, quan){
                                userMilk += quan
                                storeMilk -= quan
                                print("You have added \(quan) milk(s) to your cart!")
                            }
                            //if the user wants to add more milks than what is in stock to their cart
                            else{
                                print("Sorry, there are only \(storeMilk) milk(s) in stock. You are unable to add \(quan) milk(s) to your cart.")
                            }
                            
                        }
                    }
                }
                //adding syrups
                else if itemToAdd == "3"{
                    print("How many syrup(s) would you like to add to your cart?")
                    if let numItem = readLine(){
                        if let quan = Int(numItem){
                            if inStock(itemToAdd, quan){
                                userSyrup += quan
                                storeSyrup -= quan
                                print("You have added \(quan) syrup(s) to your cart!")
                            }
                            //if the user wants to add more syrups than what is in stock to their cart
                            else{
                                print("Sorry, there are only \(storeSyrup) syrup(s) in stock. You are unable to add \(quan) syrup(s) to your cart.")
                            }
                        }
                    }
                }
                //adding cups
                else if itemToAdd == "4"{
                    print("How many cup(s) would you like to add to your cart?")
                    if let numItem = readLine(){
                        if let quan = Int(numItem){
                            if inStock(itemToAdd, quan){
                                userCup += quan
                                storeCup -= quan
                                print("You have added \(quan) cup(s) to your cart!")
                            }
                            //if the user wants to add more cups than what is in stock to their cart
                            else{
                                print("Sorry, there are only \(storeCup) cup(s) in stock. You are unable to add \(quan) cup(s) to your cart.")
                            }
                        }
                    }
                }
                //if the user entered an invalid answer
                else{
                    print("Invalid option.")
                }
                //prints the user's current total
                print("The current total is: $\(currentTotal())")
            }
            
        }
        //if the user chooses to remove items from their cart
        else if choice == "2"{
            print("What would you like to remove from cart? (Enter number of selection)")
            print("1. Cereal")
            print("2. Milk")
            print("3. Syrup")
            print("4. Cups")
            
            if let itemToRemove = readLine(){
                //removing cereals
                if itemToRemove == "1"{
                    print("How many cereal(s) would you like to remove from your cart?")
                    if let numItem = readLine(){
                        if let quan = Int(numItem){
                            if inCart(itemToRemove, quan){
                                storeCereal += quan
                                userCereal -= quan
                                print("You have removed \(quan) cereal(s) from your cart!")
                            }
                            //if the user wants to remove more cereals than what is in their cart
                            else{
                                print("Sorry, there are only \(userCereal) cereal(s) in your cart. You are unable to remove \(quan) cereal(s) from your cart.")
                            }
                        }
                    }
                    
                }
                //removing milks
                else if itemToRemove == "2"{
                    print("How many milk(s) would you like to remove from your cart?")
                    if let numItem = readLine(){
                        if let quan = Int(numItem){
                            if inCart(itemToRemove, quan){
                                storeMilk += quan
                                userMilk -= quan
                                print("You have removed \(quan) milk(s) from your cart!")
                            }
                            //if the user wants to remove more milks than what is in their cart
                            else{
                                print("Sorry, there are only \(userMilk) milk(s) in your cart. You are unable to remove \(quan) milk(s) from your cart.")
                            }
                            
                        }
                    }
                }
                //removing syrups
                else if itemToRemove == "3"{
                    print("How many syrup(s) would you like to remove from your cart?")
                    if let numItem = readLine(){
                        if let quan = Int(numItem){
                            if inCart(itemToRemove, quan){
                                storeSyrup += quan
                                userSyrup -= quan
                                print("You have removed \(quan) syrup(s) from your cart!")
                            }
                            //if the user wants to remove more syrups than what is in their cart
                            else{
                                print("Sorry, there are only \(userSyrup) syrup(s) in stock. You are unable to add \(quan) syrup(s) to your cart.")
                            }
                        }
                    }
                }
                //removing cups
                else if itemToRemove == "4"{
                    print("How many cup(s) would you like to remove from your cart?")
                    if let numItem = readLine(){
                        if let quan = Int(numItem){
                            if inCart(itemToRemove, quan){
                                storeCup += quan
                                userCup -= quan
                                print("You have removed \(quan) cup(s) from your cart!")
                            }
                            //if the user wants to remove more cups than what is in their cart
                            else{
                                print("Sorry, there are only \(userCup) cup(s) in your cart. You are unable to remove \(quan) cup(s) from your cart.")
                            }
                        }
                    }
                }
                //if the user enters an invalid option
                else{
                    print("Invalid option.")
                }
                //prints the user's current total
                print("The current total is: $\(currentTotal())")
            }
        }
        
        //if the user chooses to check the stock status of an item
        else if choice == "3"{
            print("What item would you like to check the stock status of? (Enter number of selection)")
            print("1. Cereal")
            print("2. Milk")
            print("3. Syrup")
            print("4. Cups")
            
            if let itemToCheck = readLine(){
                //checking cereal
                if itemToCheck == "1"{
                    print("There are currently \(storeCereal) cereal(s) in stock!")
                }
                //checking milk
                else if itemToCheck == "2"{
                    print("There are currently \(storeMilk) milk(s) in stock!")
                }
                //checking syrup
                else if itemToCheck == "3"{
                    print("There are currently \(storeSyrup) syrups(s) in stock!")
                }
                //checking cups
                else if itemToCheck == "4"{
                    print("There are currently \(storeCup) cups(s) in stock!")
                }
                else{
                    print("Invalid option.")
                }
            }
        }
        
        //if the user chooses to use the admin menu
        else if choice == "4"{
            print("Enter Admin ID: ")
            
            if let idEntered = readLine(){
                //checks if the pin entered was correct (pin is "1234")
                if idEntered == "1234"{
                    while choice == "4"{
                        print("Welcome to the Admin menu! Let us know how we can help you! (Enter number of selection)")
                        print("1. Restock inventory")
                        print("2. Generate report")
                        print("3. Check number of items")
                        print("4. Quit Admin menu")
                        
                        if let workerChoice = readLine(){
                            //if the user chooses to restock
                            if workerChoice == "1"{
                                print("What item would you like to restock? (Enter number of selection)")
                                print("1. Cereal")
                                print("2. Milk")
                                print("3. Syrup")
                                print("4. Cups")
                                
                                if let itemToRestock = readLine(){
                                    //restocking the cereal
                                    if itemToRestock == "1"{
                                        print("Enter the amount you want to set the cereal stock to")
                                        
                                        if let amount = readLine(){
                                            if let theAmount = Int(amount){
                                                storeCereal = theAmount
                                            }
                                        }
                                    }
                                    //restocking the milk
                                    else if itemToRestock == "2"{
                                        print("Enter the amount you want to set the milk stock to")
                                        
                                        if let amount = readLine(){
                                            if let theAmount = Int(amount){
                                                storeMilk = theAmount
                                            }
                                        }
                                    }
                                    //restocking the syrup
                                    else if itemToRestock == "3"{
                                        print("Enter the amount you want to set the syrup stock to")
                                        
                                        if let amount = readLine(){
                                            if let theAmount = Int(amount){
                                                storeSyrup = theAmount
                                            }
                                        }
                                        
                                    }
                                    //restocking the cups
                                    else if itemToRestock == "4"{
                                        print("Enter the amount you want to set the cup stock to")
                                        
                                        if let amount = readLine(){
                                            if let theAmount = Int(amount){
                                                storeCup = theAmount
                                            }
                                        }
                                    }
                                    else{
                                        print("Invalid option.")
                                    }
                                }
                            }
                            //if the user chooses to get a summary report
                            else if workerChoice == "2"{
                                print("Summary Report:")
                                print("Remaining Cereals: \(storeCereal)")
                                print("Remaining Milks: \(storeMilk)")
                                print("Remaining Syrups: \(storeSyrup)")
                                print("Remaining Cups: \(storeCup)")
                                
                                let totalInventory: Int = storeCereal + storeMilk + storeSyrup + storeCup
                                print("Remaining Inventory: \(totalInventory)")
                                
                                print("Total Sales: $\(currentTotal())")
                            }
                            //if the user chooses to chance the stock of an item
                            else if workerChoice == "3"{
                                print("What item would you like to check the stock status of? (Enter number of selection)")
                                print("1. Cereal")
                                print("2. Milk")
                                print("3. Syrup")
                                print("4. Cups")
                                
                                if let itemToCheck = readLine(){
                                    //updating the stock of the cereal
                                    if itemToCheck == "1"{
                                        print("There are currently \(storeCereal) cereal(s) in stock!")
                                    }
                                    //updating the stock of the milk
                                    else if itemToCheck == "2"{
                                        print("There are currently \(storeMilk) milk(s) in stock!")
                                    }
                                    //updating the stock of the syrup
                                    else if itemToCheck == "3"{
                                        print("There are currently \(storeSyrup) syrups(s) in stock!")
                                    }
                                    //updating the stock of the cups
                                    else if itemToCheck == "4"{
                                        print("There are currently \(storeCup) cups(s) in stock!")
                                    }
                                    //if an invalid option was chosen
                                    else{
                                        print("Invalid option.")
                                    }
                                }
                            }
                            //when the user wants to return to the normal menu
                            else if workerChoice == "4"{
                                print("Returning to normal menu")
                                break
                            }
                            //if the user enters an invalid answer
                            else{
                                print("Invalid option.")
                            }
                        }
                    }
                }
                //if the user entered the wrong ID
                else{
                    print("Invalid ID. You are unable to access the admin menu")
                }
            }
            
        }
        //when the user wants to checkout
        else if choice == "5"{
            shop = false;
        }
    }
}

//checkout
print("Thanks for shopping with us!")
print("You purchased the following: ")
print("Cereals: \(userCereal)")
print("Milks: \(userMilk)")
print("Syrups: \(userSyrup)")
print("Cups: \(userCup)")
var grandTotal: Double = round(currentTotal()*9.25)/100
print("Your grand total including tax (9.25%) is: $\(grandTotal)")
