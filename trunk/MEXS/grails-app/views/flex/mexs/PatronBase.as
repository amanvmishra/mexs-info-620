/**
 * Generated by Gas3 v2.3.0 (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (Patron.as).
 */

package mexs {

    import flash.events.EventDispatcher;
    import flash.net.FileReference;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import flash.utils.IExternalizable;
    import flash.utils.getQualifiedClassName;
    import mx.collections.ListCollectionView;
    import mx.core.IUID;
    import mx.utils.UIDUtil;
    import org.granite.collections.IPersistentCollection;
    import org.granite.meta;
    import org.granite.tide.IEntity;
    import org.granite.tide.IEntityManager;
    import org.granite.tide.IPropertyHolder;

    use namespace meta;

    [Managed]
    public class PatronBase implements IExternalizable, IUID {

        protected var _em:IEntityManager = null;

        private var __initialized:Boolean = true;
        private var __detachedState:String = null;

        private var _country:String;
        private var _dateOfBirth:Date;
        private var _firstName:String;
        private var _id:Number;
        private var _lastName:String;
        private var _passportNumber:int;
        private var _patronID:int;
        private var _transactions:ListCollectionView;
        private var _version:Number;

        meta function isInitialized(name:String = null):Boolean {
            if (!name)
                return __initialized;

            var property:* = this[name];
            return (
                (!(property is Patron) || (property as Patron).meta::isInitialized()) &&
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
    
    	public static const meta_hasMany:Object = {
			transactions: Transaction
		}
    
    	public static const meta_constraints:Array = [
    		{ property: "dateOfBirth" }, 
    		{ property: "country" }, 
    		{ property: "firstName" }, 
    		{ property: "lastName" }, 
    		{ property: "passportNumber" }, 
    		{ property: "patronID" }, 
    		{ property: "transactions",
				association: "oneToMany", bidirectional: "true"
    		}
		]

        public function set country(value:String):void {
            _country = value;
        }
        public function get country():String {
            return _country;
        }

        public function set dateOfBirth(value:Date):void {
            _dateOfBirth = value;
        }
        public function get dateOfBirth():Date {
            return _dateOfBirth;
        }

        public function set firstName(value:String):void {
            _firstName = value;
        }
        public function get firstName():String {
            return _firstName;
        }

        public function set id(value:Number):void {
            _id = value;
        }
        [Id]
        public function get id():Number {
            return _id;
        }

        public function set lastName(value:String):void {
            _lastName = value;
        }
        public function get lastName():String {
            return _lastName;
        }

        public function set passportNumber(value:int):void {
            _passportNumber = value;
        }
        public function get passportNumber():int {
            return _passportNumber;
        }

        public function set patronID(value:int):void {
            _patronID = value;
        }
        public function get patronID():int {
            return _patronID;
        }

        public function set transactions(value:mx.collections.ListCollectionView):void {
            _transactions = value;
        }
        public function get transactions():ListCollectionView {
            return _transactions;
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
            var src:PatronBase = PatronBase(obj);
            __initialized = src.__initialized;
            __detachedState = src.__detachedState;
            if (meta::isInitialized()) {
               	em.meta_mergeExternal(src._country, _country, null, this, 'country', function setter(o:*):void{_country = o as String});
               	em.meta_mergeExternal(src._dateOfBirth, _dateOfBirth, null, this, 'dateOfBirth', function setter(o:*):void{_dateOfBirth = o as Date});
               	em.meta_mergeExternal(src._firstName, _firstName, null, this, 'firstName', function setter(o:*):void{_firstName = o as String});
               	em.meta_mergeExternal(src._id, _id, null, this, 'id', function setter(o:*):void{_id = o as Number});
               	em.meta_mergeExternal(src._lastName, _lastName, null, this, 'lastName', function setter(o:*):void{_lastName = o as String});
               	em.meta_mergeExternal(src._passportNumber, _passportNumber, null, this, 'passportNumber', function setter(o:*):void{_passportNumber = o as int});
               	em.meta_mergeExternal(src._patronID, _patronID, null, this, 'patronID', function setter(o:*):void{_patronID = o as int});
               	em.meta_mergeExternal(src._transactions, _transactions, null, this, 'transactions', function setter(o:*):void{_transactions = o as ListCollectionView});
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
                _country = input.readObject() as String;
                _dateOfBirth = input.readObject() as Date;
                _firstName = input.readObject() as String;
                _id = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
                _lastName = input.readObject() as String;
                _passportNumber = input.readObject() as int;
                _patronID = input.readObject() as int;
                _transactions = input.readObject() as ListCollectionView;
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
                output.writeObject((_country is IPropertyHolder) ? IPropertyHolder(_country).object : _country); 
                output.writeObject((_dateOfBirth is IPropertyHolder) ? IPropertyHolder(_dateOfBirth).object : _dateOfBirth); 
                output.writeObject((_firstName is IPropertyHolder) ? IPropertyHolder(_firstName).object : _firstName); 
                output.writeObject((_id is IPropertyHolder) ? IPropertyHolder(_id).object : _id); 
                output.writeObject((_lastName is IPropertyHolder) ? IPropertyHolder(_lastName).object : _lastName); 
                output.writeObject((_passportNumber is IPropertyHolder) ? IPropertyHolder(_passportNumber).object : _passportNumber); 
                output.writeObject((_patronID is IPropertyHolder) ? IPropertyHolder(_patronID).object : _patronID); 
                output.writeObject((_transactions is IPropertyHolder) ? IPropertyHolder(_transactions).object : _transactions); 
                output.writeObject((_version is IPropertyHolder) ? IPropertyHolder(_version).object : _version);
            }
            else {
                output.writeObject(_id);
            }
        }
    }
}
