from boa.blockchain.vm.Neo.Runtime import GetTrigger, CheckWitness, Notify, Log
from boa.blockchain.vm.Neo.TriggerType import Application, Verification

from storage import StorageAPI


def Main(operation, args):
    Log(args)

    trigger = GetTrigger()

    storage = StorageAPI()

    arg_error = 'Incorrect Arg Length'

    if trigger == Verification():
        # todo maybe implement later
        return True

    elif trigger == Application():
        if operation != None:
            if operation == "balance":
                if len(args) == 1:
                    account = args[0]
                    balance = storage.get(account)
                    return balance
                Log(arg_error)
                return arg_error
            if operation == "accrue":
                if len(args) == 2:
                    account = args[0],
                    gain = args[1]
                    new_balance = storage.get(account) + gain
                    return storage.put(account, new_balance)
                Log(arg_error)
            return arg_error
        return False
