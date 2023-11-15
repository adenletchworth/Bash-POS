#!/bin/bash

if [ "$#" -lt 5 ]; then
    echo "Usage: $0 <price_apple> <price_banana> <price_orange> <price_kiwi> <price_watermelon>"
    exit 1
fi

apple_price=$1
banana_price=$2
orange_price=$3
kiwi_price=$4
watermelon_price=$5

isShopping=true
totalCost=0

printOptions() {
    echo "*** Welcome to the Fruit Vendor Guild ***"
    echo "*** Select Fruits to buy***"
    echo "(1) Apple"
    echo "(2) Banana"
    echo "(3) Orange"
    echo "(4) Kiwi"
    echo "(5) Watermelon"
    echo "(6) Checkout"
    echo "- Please select option (1-6):"
}

processSale() {
    
    local choice=$1
    price=0

    case $choice in
        1) price=$apple_price ;;
        2) price=$banana_price ;;
        3) price=$orange_price ;;
        4) price=$kiwi_price ;;
        5) price=$watermelon_price ;;
        *) echo "Invalid choice. Please enter a number between 1 and 6." ;;
    esac

    if [ $price -gt 0 ]; then
        echo "* Fruit Selected (price: $price) *"
        echo "- Enter quantity:"
        read fruitQuantity

        salePrice=$((price * fruitQuantity))
        ((totalCost+=salePrice))
    fi
}

checkout() {
    isShopping=false
    echo "* Checkout Selected. Grand total: $totalCost *"
}

while $isShopping; do
    printOptions
    read userChoice
    if [ "$userChoice" -ne 6 ]; then
        processSale "$userChoice"
    else
        checkout
    fi
done
