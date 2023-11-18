#!/bin/csh

if ($#argv < 5) then
    echo "Usage: $0 <price_apple> <price_banana> <price_orange> <price_kiwi> <price_watermelon>"
    exit 1
endif

set fruit = ($1 $2 $3 $4 $5)
set totalCost = 0
set isShopping = 1

alias printOptions 'echo "*** Welcome to the Fruit Vendor Guild ***" ; echo "*** Select Fruits to buy***" ; echo "(1) Apple" ; echo "(2) Banana" ; echo "(3) Orange" ; echo "(4) Kiwi" ; echo "(5) Watermelon" ; echo "(6) Checkout" ; echo "- Please select option (1-6):"'

alias processSale 'set choice = $1 ; set price = 0 ; if ($choice >= 1 && $choice <= 5) then set price = $fruit[$choice] ; echo "* $fruit[$choice] Selected (price: $price) *" ; echo "- Enter quantity:" ; set fruitQuantity = $< ; set tempCost = `expr $price \* $fruitQuantity` ; @ totalCost = $totalCost + $tempCost ; else if ($choice != 6) then echo "Invalid choice. Please enter a number between 1 and 6." ; endif'

alias checkout 'set isShopping = 0 ; echo "* Checkout Selected. Grand total: $totalCost *"'


while ($isShopping) 
    printOptions
    set userChoice = $<
    
    if ($userChoice >= 1 && $userChoice <= 6) then
        processSale $userChoice
    else
        echo "Invalid choice. Please enter a number between 1 and 6."
    endif

end
