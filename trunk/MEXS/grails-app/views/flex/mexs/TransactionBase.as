/**
 * Generated by Gas3 v2.3.0 (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (Transaction.as).
 */

package mexs {

    import flash.events.EventDispatcher;
    import flash.net.FileReference;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import flash.utils.IExternalizable;
    import flash.utils.getQualifiedClassName;
    import mx.core.IUID;
    import mx.utils.UIDUtil;
    import org.granite.collections.IPersistentCollection;
    import org.granite.meta;
    import org.granite.tide.IEntity;
    import org.granite.tide.IEntityManager;
    import org.granite.tide.IPropertyHolder;

    use namespace meta;

    [Managed]
    public class TransactionBase implements IExternalizable, IUID {

        protected var _em:IEntityManager = null;

        private var __initialized:Boolean = true;
        private var __detachedState:String = null;

        private var _commissionRate:Number;
        private var _dateOfTransaction:Date;
        private var _employeeID:Employee;
        private var _id:Number;
        private var _patronID:Patron;
        private var _sourceAmount:Number;
        private var _sourceCurrencyID:Currency;
        private var _targetCurrencyID:Currency;
        private var _terminalID:Terminal;
        private var _totalTargetAmount:Number;
        private var _totalTransactionAmount:Number;
        private var _transactionID:int;
        private var _version:Number;

        meta function isInitialized(name:String = null):Boolean {
            if (!name)
                return __initialized;

            var property:* = this[name];
            return (
                (!(property is Transaction) || (property as Transaction).meta::isInitialized()) &&
                (!(property is IPersistentCollection) || (property as IPersistentCollection).isInitialized())
            );
        }

        [Transient]
        public function meta_getEntityManager():IEntityManager {
            return _em;
        }
        public function meta_setEntityManager(em:IEntityManager):void {
        	_em = em;
        }
    
    	public static const meta_constraints:Array = [
    		{ property: "commissionRate" }, 
    		{ property: "dateOfTransaction" }, 
    		{ property: "employeeID",
				association: "manyToOne", bidirectional: "true"
    		}, 
    		{ property: "patronID",
				association: "manyToOne", bidirectional: "true"
    		}, 
    		{ property: "sourceAmount" }, 
    		{ property: "sourceCurrencyID",
				association: "oneToOne"
    		}, 
    		{ property: "targetCurrencyID",
				association: "oneToOne"
    		}, 
    		{ property: "terminalID",
				association: "manyToOne", bidirectional: "true"
    		}, 
    		{ property: "totalTargetAmount" }, 
    		{ property: "totalTransactionAmount" }, 
    		{ property: "transactionID" }
		]

        public function set commissionRate(value:Number):void {
            _commissionRate = value;
        }
        public function get commissionRate():Number {
            return _commissionRate;
        }

        public function set dateOfTransaction(value:Date):void {
            _dateOfTransaction = value;
        }
        public function get dateOfTransaction():Date {
            return _dateOfTransaction;
        }

        public function set employeeID(value:mexs.Employee):void {
            _employeeID = value;
        }
        public function get employeeID():Employee {
            return _employeeID;
        }

        public function set id(value:Number):void {
            _id = value;
        }
        [Id]
        public function get id():Number {
            return _id;
        }

        public function set patronID(value:mexs.Patron):void {
            _patronID = value;
        }
        public function get patronID():Patron {
            return _patronID;
        }

        public function set sourceAmount(value:Number):void {
            _sourceAmount = value;
        }
        public function get sourceAmount():Number {
            return _sourceAmount;
        }

        public function set sourceCurrencyID(value:mexs.Currency):void {
            _sourceCurrencyID = value;
        }
        public function get sourceCurrencyID():Currency {
            return _sourceCurrencyID;
        }

        public function set targetCurrencyID(value:mexs.Currency):void {
            _targetCurrencyID = value;
        }
        public function get targetCurrencyID():Currency {
            return _targetCurrencyID;
        }

        public function set terminalID(value:mexs.Terminal):void {
            _terminalID = value;
        }
        public function get terminalID():Terminal {
            return _terminalID;
        }

        public function set totalTargetAmount(value:Number):void {
            _totalTargetAmount = value;
        }
        public function get totalTargetAmount():Number {
            return _totalTargetAmount;
        }

        public function set totalTransactionAmount(value:Number):void {
            _totalTransactionAmount = value;
        }
        public function get totalTransactionAmount():Number {
            return _totalTransactionAmount;
        }

        public function set transactionID(value:int):void {
            _transactionID = value;
        }
        public function get transactionID():int {
            return _transactionID;
        }

        public function set version(value:Number):void {
            _version = value;
        }
        [Version]
        public function get version():Number {
            return _version;
        }

        public function set uid(value:String):void {
            // noop...
        }
        public function get uid():String {
            if (isNaN(_id))
                return UIDUtil.createUID();
            return getQualifiedClassName(this) + "#[" + String(_id) + "]";
        }

        public function meta_merge(em:IEntityManager, obj:*):void {
            var src:TransactionBase = TransactionBase(obj);
            __initialized = src.__initialized;
            __detachedState = src.__detachedState;
            if (meta::isInitialized()) {
               	em.meta_mergeExternal(src._commissionRate, _commissionRate, null, this, 'commissionRate', function setter(o:*):void{_commissionRate = o as Number});
               	em.meta_mergeExternal(src._dateOfTransaction, _dateOfTransaction, null, this, 'dateOfTransaction', function setter(o:*):void{_dateOfTransaction = o as Date});
               	em.meta_mergeExternal(src._employeeID, _employeeID, null, this, 'employeeID', function setter(o:*):void{_employeeID = o as Employee});
               	em.meta_mergeExternal(src._id, _id, null, this, 'id', function setter(o:*):void{_id = o as Number});
               	em.meta_mergeExternal(src._patronID, _patronID, null, this, 'patronID', function setter(o:*):void{_patronID = o as Patron});
               	em.meta_mergeExternal(src._sourceAmount, _sourceAmount, null, this, 'sourceAmount', function setter(o:*):void{_sourceAmount = o as Number});
               	em.meta_mergeExternal(src._sourceCurrencyID, _sourceCurrencyID, null, this, 'sourceCurrencyID', function setter(o:*):void{_sourceCurrencyID = o as Currency});
               	em.meta_mergeExternal(src._targetCurrencyID, _targetCurrencyID, null, this, 'targetCurrencyID', function setter(o:*):void{_targetCurrencyID = o as Currency});
               	em.meta_mergeExternal(src._terminalID, _terminalID, null, this, 'terminalID', function setter(o:*):void{_terminalID = o as Terminal});
               	em.meta_mergeExternal(src._totalTargetAmount, _totalTargetAmount, null, this, 'totalTargetAmount', function setter(o:*):void{_totalTargetAmount = o as Number});
               	em.meta_mergeExternal(src._totalTransactionAmount, _totalTransactionAmount, null, this, 'totalTransactionAmount', function setter(o:*):void{_totalTransactionAmount = o as Number});
               	em.meta_mergeExternal(src._transactionID, _transactionID, null, this, 'transactionID', function setter(o:*):void{_transactionID = o as int});
               	em.meta_mergeExternal(src._version, _version, null, this, 'version', function setter(o:*):void{_version = o as Number});
            }
            else {
               em.meta_mergeExternal(src._id, _id, null, this, 'id', function setter(o:*):void{_id = o as Number});
            }
        }

        public function readExternal(input:IDataInput):void {
            __initialized = input.readObject() as Boolean;
            __detachedState = input.readObject() as String;
            if (meta::isInitialized()) {
                _commissionRate = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
                _dateOfTransaction = input.readObject() as Date;
                _employeeID = input.readObject() as Employee;
                _id = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
                _patronID = input.readObject() as Patron;
                _sourceAmount = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
                _sourceCurrencyID = input.readObject() as Currency;
                _targetCurrencyID = input.readObject() as Currency;
                _terminalID = input.readObject() as Terminal;
                _totalTargetAmount = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
                _totalTransactionAmount = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
                _transactionID = input.readObject() as int;
                _version = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
            }
            else {
                _id = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
            }
        }

        public function writeExternal(output:IDataOutput):void {
            output.writeObject(__initialized);
            output.writeObject(__detachedState);
            if (meta::isInitialized()) { 
                output.writeObject((_commissionRate is IPropertyHolder) ? IPropertyHolder(_commissionRate).object : _commissionRate); 
                output.writeObject((_dateOfTransaction is IPropertyHolder) ? IPropertyHolder(_dateOfTransaction).object : _dateOfTransaction); 
                output.writeObject((_employeeID is IPropertyHolder) ? IPropertyHolder(_employeeID).object : _employeeID); 
                output.writeObject((_id is IPropertyHolder) ? IPropertyHolder(_id).object : _id); 
                output.writeObject((_patronID is IPropertyHolder) ? IPropertyHolder(_patronID).object : _patronID); 
                output.writeObject((_sourceAmount is IPropertyHolder) ? IPropertyHolder(_sourceAmount).object : _sourceAmount); 
                output.writeObject((_sourceCurrencyID is IPropertyHolder) ? IPropertyHolder(_sourceCurrencyID).object : _sourceCurrencyID); 
                output.writeObject((_targetCurrencyID is IPropertyHolder) ? IPropertyHolder(_targetCurrencyID).object : _targetCurrencyID); 
                output.writeObject((_terminalID is IPropertyHolder) ? IPropertyHolder(_terminalID).object : _terminalID); 
                output.writeObject((_totalTargetAmount is IPropertyHolder) ? IPropertyHolder(_totalTargetAmount).object : _totalTargetAmount); 
                output.writeObject((_totalTransactionAmount is IPropertyHolder) ? IPropertyHolder(_totalTransactionAmount).object : _totalTransactionAmount); 
                output.writeObject((_transactionID is IPropertyHolder) ? IPropertyHolder(_transactionID).object : _transactionID); 
                output.writeObject((_version is IPropertyHolder) ? IPropertyHolder(_version).object : _version);
            }
            else {
                output.writeObject(_id);
            }
        }
    }
}
