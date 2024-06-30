from flask import Flask, request, jsonify
from db_utils import (get_products as fetch_products, new_product as create_product, get_expiry as get_expiry_date,
                      no_longer_made as discontinue_product)

app = Flask(__name__)


# The main endpoint(homepage). I have made this page the one which lists all the products
@app.route('/', methods=['GET'])
def get_all_products():
    biscuits = fetch_products()
    return jsonify(biscuits)


# This endpoint is meant to show the new details of the biscuit which has been added to the database. Unfortunately I
# could not get this endpoint to work and kept getting a 405 error saying 'Method Not Allowed'. The information does
# still update on the homepage
@app.route('/new_biscuit', methods=['POST'])
def add_new_product():
    new_biscuit = request.get_json()
    create_product(new_biscuit)
    return jsonify(new_biscuit)


# This endpoint shows all the information in expiry date order so that the user knows which biscuits will expire first
@app.route('/expiry', methods = ['GET'])
def get_expiry():
    expiry = get_expiry_date()
    return jsonify(expiry)


# This endpoint is meant to show the details of the biscuit which the used has decided to discontinue. Unfortunately, I
# was unable to get this working correctly and kept getting a 405 error 'Method Not Allowed'. The data however, does get
# deleted from the database and the homepage shows the updated list
@app.route('/discontinued', methods = ['DELETE'])
def discontinued_biscuit():
    biscuit_id = request.args.get('batch_no')
    if not biscuit_id:
        return jsonify({'error': 'Biscuit ID is required'})

    discontinued = discontinue_product(biscuit_id)
    return jsonify(discontinued)


if __name__ == '__main__':
    app.run(debug=True, port=5001)

