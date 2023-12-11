import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore, messaging
from schedule import *
import datetime

cred = credentials.Certificate('myfoodtracker-momi-f65210c26ee9.json')

app = firebase_admin.initialize_app(cred)

db = firestore.client()


@repeat(every().day.at("11:10"))
def send_notifications():
    users_ref = db.collection("users")
    docs = users_ref.stream()
    datab = list()
    for el in docs:
        doc = {el.id: el.to_dict()}
        absent = True
        for elem in doc[el.id]['StorageList']:
            if ((datetime.datetime.today() + datetime.timedelta(days=3)) >= datetime.datetime.strptime(
                    elem['expiration'], "%d-%m-%Y")) & absent:
                datab.append(doc[el.id]['deviceId'])
                absent = False
    for dv in datab:
        message = messaging.MulticastMessage(
            notification=messaging.Notification(
                title="Prodotto in scadenza",
                body="Visita la tua dispensa per controllare che prodotti sono in scadenza",
                image=""
            ),
            tokens=dv,
        )
        response = messaging.send_each_for_multicast(message)
        print('{0} messages were sent successfully'.format(response.success_count))
    if response.failure_count > 0:
        responses = response.responses
        failed_tokens = []
        for idx, resp in enumerate(responses):
            if not resp.success:
                # The order of responses corresponds to the order of the registration tokens.
                failed_tokens.append(dv[idx])
        print('List of tokens that caused failures: {0}'.format(failed_tokens))
