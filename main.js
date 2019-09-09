const inquirer = require('inquirer');
const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Italia3357402203',
  database: 'amazon_db',
  port: 3306
});

connection.connect(function(err) {
  if (err) throw err;
  console.log('Connected!');
});
function addItem(name, dept, price, qty) {
  connection.query(
    `INSERT INTO product_list (product_name, dept_name, price, quantity)
      VALUES ('${name}', '${dept}', ${price}, ${qty});`,
    (err, res, fields) => {
    }
  );
}


function getQuery(callback) {
  connection.query(`select * from product_list`, function(err, res, fields) {
    let allProductNames = res.map(item => item.product_name);
    let allProductPrices = res.map(item => item.price)
      let allProductsQuantities = res.map(item => item.quantity)
    callback(allProductNames, allProductPrices, allProductsQuantities);
  });
}

function sellQuery(callback, totalSale, updatedInventory, productName, quantityOrdered) {
    let oldStock = updatedInventory + quantityOrdered;

    connection.query(`INSERT INTO da_bank_statements (transaction_amount, transaction_item, old_item_stock, transaction_quantity, updated_stock) VALUES (${totalSale},'${productName}', ${oldStock}, ${quantityOrdered}, ${updatedInventory})`)
    callback(updatedInventory, productName)
}
function handleSale(inventory, proName){
    let date = new Date();
    connection.query(`UPDATE product_list SET quantity=${inventory} WHERE product_name='${proName}'`)
    connection.query(``)
    inquirer.prompt([
        {
            type: 'list',
            name:'again',
            message: 'Thank you for shopping with us, would you like to buy something else? or exit?',
            choices: ['BuySomething', "Exit"]
        }
    ]).then(answer => {
        if (answer.again === 'BuySomething'){
            getQuery(buyItemsPrompt);
        }
        else {
    connection.end()
        }
    })
}

/**
 *
 * @param {array} itemNamesList
 */
function buyItemsPrompt(n, p, q) {
    let itemNameArray = n;
    let itemPriceArray = p;
    let itemQTArray = q;
    inquirer.prompt([{
        type: 'list',
        name: 'item',
        message: 'What item would you like to purchase today kind human? ',
        choices: itemNameArray

    }]).then((answer) => {
        let nameOfProduct = answer.item
            let index = itemNameArray.indexOf(answer.item);
        let price = itemPriceArray[index];
        inquirer.prompt([{
            type: "list",
            name: 'buyItem',
            message: `would you like to purchase item ${answer.item}? it is $${price} for one of 'em`,
            choices: ['yes', 'no']
        }


        ]).then(answer => {
            if(answer.buyItem === 'yes'){
               inquirer.prompt([
                   {
                       type: 'number',
                       name: 'quantity',
                       message: `how many? we have ${itemQTArray[index]} in the back ;)`,
                       default: 1

                   }

               ]).then(answer => {
                   let quant = answer.quantity;
                   let totalBill = quant * price;
                   let newInventoryAmount = itemQTArray[index] - quant
                   if(answer.quantity > itemQTArray[index]){
                       inquirer.prompt([
                           {
                               type: 'list',
                               choices: ['Go Back', 'Buy Max Amount'],
                               name: 'bigOrder',
                               message: `i'm so sorry but we only have ${itemQTArray[index]} items in stock would you like to buy the max amount $${itemQTArray[index]*price}? or go back?`
                           }
                       ]).then(answer => {
                           if(answer.bigOrder === 'Buy Max Amount'){
                               quant = itemQTArray[index]
                               newInventoryAmount = 0;
                               sellQuery(handleSale, totalBill, newInventoryAmount, nameOfProduct, quant )

                           }
                       })


                   }
                   else{

                       inquirer.prompt([
                           {
                               type: "list",
                               name: 'purchaseConfirmation',
                               message: `ok? if you are not sure you can always go back your total is ${totalBill}$`,
                               choices: ['buy', 'go back']
                           }
                       ]).then(answer => {
                           if(answer.purchaseConfirmation === 'buy'){

                               console.log('thank you so much for your purchase we greatly appreciate your commitment to our cause :)')
                               console.log('You were billed :', totalBill + '$')
                               console.log('for', nameOfProduct)
                               sellQuery(handleSale, totalBill, newInventoryAmount, nameOfProduct, quant )


                           }
                           else{getQuery(buyItemsPrompt)}
                       })
                   }

               })

            }
            else{
                getQuery(buyItemsPrompt);

            }
        })
    });

}

getQuery(buyItemsPrompt);


// addItem('Dog Food', 'Pet_Food', 17.99, 2000);
// addItem('Bananas', 'Food', .87, 1500);
// addItem('Silverware', 'Housewares', 8.99, 2000);
// addItem('Canon Mark II', 'Electronics', 2000.99, 200);
// addItem('Speakers', 'Electronics', 167.33, 500);
// addItem('Baseball', 'Sport', 2.99, 2000);
// addItem('Athletic Tape', 'Sport', 6.78, 1200);
//#region

// //#endregion
