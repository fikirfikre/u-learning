/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */
const functions =require('firebase-functions');
const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const stripe = require('stripe')(functions.config().stripe.testkey);

const calculateOrderAmount = (items) => {
 
    prices = [];
    catalog =[

        {'id':'0','price':2.99},
        {'id':'1','price':2.99},
        {'id':'2','price':2.99},
        {'id':'3','price':2.99},
        {'id':'4','price':2.99}
    ];
    items.array.forEach(item => {
        price = catalog.find(x=> x.id == item.id).price;
        prices.push(price);
        
    }
    
    );
    return parseInt(prices.reduce((a,b)=> a+b) * 100);

}

const generateResponse = function (intent){
    switch (intent.status) {
        case 'require_action':
            return{
                clinetSecret:intent.clinetSecret,
                requiresAction: true,
                status: intent.status
            };
        case 'requires_payment_method':
            return {
                'error': 'Your card was denited, please provide a new payment method',
            };
        case 'succeeded':
            console.log('payment succeeded');
            return{
                clinetSecret:intent.clinetSecret,
                status:intent.status
            };
    
        default:
           return 'error';
    };
}
exports.StripePayEndopointMethodId = functions.https.onRequest(async (req, res)=>{
    const {paymentMethodId, items, currency, useStripeSdk}=req.body;
    const orderAmount = 1000;
    try {
        if(paymentMethodId){
            const params = {
                amount: orderAmount,
                confirm:true,
                confirmation_method: 'manual',
                currency:currency,
                payment_method: paymentMethodId,
                use_stripe_skd: useStripeSdk
            }
            const intent = await stripe.paymentIntents.create(params);
            console.log("Intenet:${intent}");
            return res.send(generateResponse(intent));
        }
        return res.sendStatus(400);
    } catch (e) {
        return res.send({error:e.message});
    }
});
exports.StripePayEndopointIntentId = functions.https.onRequest(async(req,res)=>{
    const {paymentIntentsId} = req.body;
    const orderAmount = calculateOrderAmount(item);
    try {
        if(paymentIntentsId){
            const intent = await stripe.paymentIntents.confirm(paymentIntentsId);
            return res.send(generateResponse(intent));
        }
        return res.sendStatus(400);
    } catch (e) {
        return res.send({error:e.message});
    }
});

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
