import requests
import json

# Defining the function to list all the information from my database
def get_all_products():
    result = requests.get(
        'http://127.0.0.1:5001',
        headers={'content-type': 'application/json'}
    )
    return result.json()

# Defining the function to add a new product to the database
def add_new_product(batch_no, biscuit_name, price_per_pack, allergy_info, expiry_date):
    new_biscuit = {
        'batch_no': batch_no,
        'biscuit_name': biscuit_name,
        'price_per_pack': price_per_pack,
        'allergy_info': allergy_info,
        'expiry_date': expiry_date,
    }

    result = requests.post(
        'http://127.0.0.1:5001/new_biscuit',
        headers={'content-type': 'application/json'},
        data=json.dumps(new_biscuit)
    )

    return result.json()

# Defining the function to list the products by expiry date
def get_expiry():
    result = requests.get(
        'http://127.0.0.1:5001/expiry',
        headers={'content-type': 'application/json'},

    )
    return result.json()

# Defining the function to delete a discontinued product
def discontinue_biscuit(biscuit_id):
    result = requests.delete(
        'http://127.0.0.1:5001/discontinued',
        headers={'content-type': 'application/json'},
        params={'batch_no': biscuit_id}
    )
    return result.json()

# Running the code to interact with the API
def run():
    # Welcome message with weblink
    print('######################################################################')
    print('Welcome to Pharaoh Biscuits, please browse our range of biscuits here:')
    print('http://127.0.0.1:5001')
    print('######################################################################')
    print()

    # Asking the user if they would like to add a new biscuits details to database
    add_biscuit = input('Would you like to add a new biscuit? (y/n): ').lower() == 'y'

    # Running the if statement if they choose to add a new biscuit, asking for all the information required before
    # advising if the record has been updated successfully or not
    if add_biscuit:
        try:
            batch_number = int(input('Please enter the batch no: '))
            biscuit_name = input('Please enter the name of the new biscuit: ')
            price_per_pack = float(input('Please enter the price of the new packet: '))
            allergy_info = input('Please provide any allergy information, e.g. gluten,oats,milk: ')
            expiry_date = input('Please enter the date of expiry for the new packet of biscuits YYYY-MM-DD: ')
            new_biscuit = add_new_product(batch_number, biscuit_name, price_per_pack, allergy_info, expiry_date)
            print('Your new biscuit details have been added:')
            print(new_biscuit)

        except ValueError:
            print('Invalid input. Please ensure numerical values are entered correctly.')
        except Exception:
            print('An error occurred')

    # Asking the user if they would like to discontinue any of the biscuits listed
    discontinue = input('Would you like to discontinue a biscuit? (y/n): ').lower() == 'y'

    # Running the if statement if the user decides to discontinue any of the listed biscuits and advising them if the
    # record has been successfully deleted or not
    if discontinue:
        try:
            biscuit_id = int(input('Please enter the batch number of the biscuit you wish to discontinue: '))
            response = discontinue_biscuit(biscuit_id)
            print(response)

        except ValueError:
            print('Invalid input. Please ensure numerical values are entered correctly.')
        except Exception:
            print('An error occurred')

    # Allowing the user to check which products will be expiring the soonest by clicking on the link
    print('To check which products are due to expire soonest, please click here:')
    print('http://127.0.0.1:5001/expiry')

    print('Thank you for your time!')


if __name__ == '__main__':
    run()

